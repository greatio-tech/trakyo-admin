import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
import 'package:trakyo_admin/routes.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/local_storage_service.dart';
import 'api_exception.dart';

typedef JSON = Map<String, dynamic>;
typedef DioResponse<T> = Response<T>;
typedef JsonParser<T> = T Function(JSON json);
typedef ListJsonParser<T> = List<T> Function(List json);

class ApiServices {
  static const baseUrl =

      // "https://api.trakyo.com/api/";
      "http://192.168.1.5:6001/api/";
  static String? token;

  Dio dio = Dio();
  ApiServices(
      {bool makeLog = true, bool token = true, bool prettyLog = false}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    if (token) {
      dio.interceptors.add(getAppInterceptor());
    }
    if (makeLog) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        logPrint: prettyLog ? this.prettyLog : logPrint,
      ));
    }
  }

  ApiServices.custom(
      {BaseOptions? options, bool makeLog = true, bool prettyLog = false}) {
    if (options != null) dio.options = options;
    if (makeLog) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        logPrint: prettyLog ? this.prettyLog : logPrint,
      ));
    }
  }

  Future<Response> getMethod(String path,
      {JSON? parameters, JSON? data}) async {
    try {
      final response =
          await dio.get(path, queryParameters: parameters, data: data);
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> postMethod(String path,
      {JSON? parameters, JSON? data}) async {
    try {
      final response =
          await dio.post(path, queryParameters: parameters, data: data);
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> putMethod(String path,
      {JSON? parameters, JSON? data}) async {
    try {
      final response =
          await dio.put(path, queryParameters: parameters, data: data);
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> patchMethod(String path,
      {JSON? parameters, JSON? data}) async {
    try {
      final response =
          await dio.patch(path, queryParameters: parameters, data: data);
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> deleteMethod(String path,
      {JSON? parameters, JSON? data}) async {
    try {
      final response =
          await dio.delete(path, queryParameters: parameters, data: data);
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> putMultipartFile(String path,
      {JSON? parameters,
      required FormData formData,
      Function(double progress)? onSendProgress}) async {
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await dio.put(path,
          queryParameters: parameters,
          data: formData, onSendProgress: (count, total) {
        onSendProgress?.call(count / total);
      });
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<Response> postMultipartFile(String path,
      {JSON? parameters,
      required FormData formData,
      Function(double progress)? onSendProgress}) async {
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await dio.post(
        path,
        queryParameters: parameters,
        data: formData,
        onSendProgress: (count, total) {
          onSendProgress?.call(count / total);
        },
      );
      return response;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  Future<File> downloadFile(
    String url, {
    required String downloadPath,
    JSON? parameters,
    Function(double progress)? onReceiveProgress,
  }) async {
    try {
      dio.options.responseType = ResponseType.bytes;
      dio.options.followRedirects = false;
      final response = await dio.get(
        url,
        queryParameters: parameters,
        onReceiveProgress: (count, total) {
          onReceiveProgress?.call(count / total);
        },
      );

      File file = File(downloadPath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      throw ApiException.handle(e);
    }
  }

  logPrint(object) => log('$object', name: 'dio');

  prettyLog(object) =>
      log(const JsonEncoder.withIndent(' ').convert('$object'), name: 'dio');

  Interceptor getAppInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        var currToken = await getToken();
        options.headers['Authorization'] = 'Bearer $currToken';
        handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401 &&
            e.response?.data['message'] == 'Token is not valid') {
          log('token expired');
          RequestOptions requestOptions = e.requestOptions;
          var currToken = await getToken();
          if (currToken == null || currToken.isEmpty) {
            handler.reject(e.copyWith(
                type: DioExceptionType.cancel,
                message: ' No Token available for refresh token'));
            return;
          }
          Dio mDio = Dio();
          mDio.options.headers['Authorization'] = 'Bearer $currToken';
          log(currToken);
          final refreshToken = await LocalStorage().getString('refreshToken');
          await mDio.post(
            baseUrl + ApiEndpoints.refreshToken,
            data: {
              'refreshToken': refreshToken,
            },
          ).then((response) async {
            final token = response.data['accessToken'];
            final refreshToken = response.data['refreshToken'];
            await LocalStorage().removeItem('refreshToken');
            await LocalStorage().setString('refreshToken', refreshToken);

            log(response.toString(), name: 'REFRESH TOKEN RESPONSE');
            await LocalStorage().saveToken(token);
            try {
              dio.options.headers["Authorization"] = 'Bearer $token';
              var resp = await dio.request(
                requestOptions.path,
                data: requestOptions.data,
                options: Options(method: requestOptions.method),
                cancelToken: requestOptions.cancelToken,
                onReceiveProgress: requestOptions.onReceiveProgress,
                onSendProgress: requestOptions.onSendProgress,
                queryParameters: requestOptions.queryParameters,
              );
              handler.resolve(resp);
            } on DioException catch (e) {
              handler.reject(e);
            }
          }).onError((error, stackTrace) {
            log('error on RefreshToken $error');
            get_x.Get.offNamed(Routes.login);
          });
        } else {
          handler.next(e);
        }
      },
    );
  }

  static Future<String?> getToken() async {
    return (await LocalStorage().getToken());
  }
}

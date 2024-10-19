import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/screens/products/model/product_model.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';
import 'dart:html' as html;
import 'package:dio/dio.dart' as dio;

class ProductsController extends GetxController {
  static ProductsController get to => Get.find();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxList images = [].obs;

  RxBool getProductsLoading = false.obs;
  RxList<ProductModel> productsList = <ProductModel>[].obs;

  // Set the data for editing a specific product
  void setData(int index) {
    nameController.text = productsList[index].name;
    priceController.text = productsList[index].price.toString();
    descriptionController.text = productsList[index].description;
    images.value = productsList[index].images;
  }

  // Pick an image for product
  void pickImage() async {
    // Indicate loading start
    getProductsLoading(true); // Set loading state to true

    try {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*'; // Accept only image files
      uploadInput.multiple = true; // Allow multiple files selection
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          // Using a Future.forEach to handle multiple images
          Future.forEach(files, (html.File file) async {
            final reader = html.FileReader();
            reader.readAsDataUrl(file); // Convert to base64 data URL
            reader.onLoadEnd.listen((event) {
              // Add base64 string to images list
              images.add(reader.result as String);
            });
          });
        }
      });
    } catch (error) {
      // Handle errors, if any
      Utils.showError(error);
    } finally {
      // Indicate loading end
      getProductsLoading(false); // Set loading state to false
    }
  }

  // Fetch the list of products
  Future<DioResponse> productsService() async {
    return ApiServices().getMethod(
      ApiEndpoints.getProducts,
    );
  }

  Future getProducts() async {
    getProductsLoading(true);
    productsService().then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        productsList(productModelFromJson(value.data).toList());
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => getProductsLoading(false),
    );
  }

  Future<DioResponse> updateProductsService(String id) async {
    dio.FormData formData = dio.FormData();

    formData.fields.addAll([
      MapEntry("name", nameController.text),
      MapEntry("description", descriptionController.text),
      MapEntry("price", priceController.text),
    ]);

    for (int i = 0; i < images.length; i++) {
      final image = images[i];

      if (image is String) {
        final String base64Data = image.split(',').last; // Get Base64 string
        final Uint8List bytes = base64.decode(base64Data);

        formData.files.add(
          MapEntry(
            "images[]",
            dio.MultipartFile.fromBytes(
              bytes,
              filename: "image_$i.jpg",
            ),
          ),
        );
      }
    }

    try {
      final response = await ApiServices().putMultipartFile(
        "${ApiEndpoints.updateProduct}$id",
        formData: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to update product: ${response.data}');
      }
    } catch (e) {
      print('Error updating product: $e');
      throw e;
    }
  }

  Future updateProducts(String id) async {
    updateProductsService(id).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        getProducts();
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => Get.back(),
    );
  }
}

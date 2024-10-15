import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart';
import 'package:trakyo_admin/screens/qr/model/qr_model.dart';
import 'package:trakyo_admin/screens/qr_design.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';
import 'package:universal_html/html.dart' as html;

class QrController extends GetxController {
  static QrController get to => Get.find();

  final RxList<String> vehicleTypes = [
    "4 Wheeler",
    "3 Wheeler",
    "2 Wheeler",
    "Others",
  ].obs;

  RxBool vehicleTypeInvalid = false.obs;

  RxList<QrModel> qrList = <QrModel>[].obs;
  Rxn<VehicleDetails> vehicleDetails = Rxn();

  TextEditingController qrIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emergencyNo1Controller = TextEditingController();
  TextEditingController emergencyNo2Controller = TextEditingController();

  TextEditingController vehicleRegNumberController = TextEditingController();
  TextEditingController vehicleMakeController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController ownerNumberController = TextEditingController();

  @override
  void onInit() {
    qrGet();
    super.onInit();
  }

  RxBool getQrLoading = false.obs;
  RxBool generateQrLoading = false.obs;
  RxInt qrCount = 1.obs;

  setQrDetails(index) {
    qrIdController.clear();
    nameController.clear();
    numberController.clear();
    emergencyNo1Controller.clear();
    emergencyNo2Controller.clear();
    vehicleRegNumberController.clear();
    vehicleMakeController.clear();
    vehicleModelController.clear();
    ownerNameController.clear();
    ownerNumberController.clear();
    qrIdController.text = qrList[index].id;
    nameController.text = qrList[index].owner.name;
    numberController.text = qrList[index].owner.phoneNumber;
    if (qrList[index].emergencyContacts.isNotEmpty) {
      emergencyNo1Controller.text =
          qrList[index].emergencyContacts[0].phoneNumber;
    }
    if (qrList[index].emergencyContacts.length > 1) {
      emergencyNo2Controller.text =
          qrList[index].emergencyContacts[1].phoneNumber;
    }
    vehicleDetails.value = qrList[index].vehicleDetails;

    vehicleRegNumberController.text = qrList[index].vehicleDetails.licensePlate;
    vehicleMakeController.text = qrList[index].vehicleDetails.make;
    vehicleMakeController.text = qrList[index].vehicleDetails.make;
    vehicleModelController.text = qrList[index].vehicleDetails.model;
    ownerNameController.text = qrList[index].vehicleDetails.ownerName;
    ownerNumberController.text = qrList[index].vehicleDetails.ownerMobileNumber;
  }

  RxList<QrCodeModel> qrListData = <QrCodeModel>[].obs;

  Future<void> createPdf(url, id) async {
    final pdf = Document();
    pdf.addPage(await pdfPage(url, id));
    final Uint8List pdfBytes = await pdf.save();
    savePdfWeb(
        pdfBytes, "QR-${id!.substring(id!.length - 5).toUpperCase()}.pdf");
  }

  void savePdfWeb(Uint8List pdfBytes, String fileName) {
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  Future<void> createMultiplePdfs(List<QrCodeModel> qrList) async {
    for (var qr in qrList) {
      final url = qr.qrCode;
      final id = qr.id!.substring(qr.id!.length - 5).toUpperCase();

      try {
        await createPdf(url, id);
      } catch (e) {
        log('Error generating PDF for ID $id: $e');
      }
    }
  }

  Future<DioResponse> qrService() async {
    return ApiServices().postMethod(
      ApiEndpoints.generateQr,
      data: {
        "count": qrCount.value,
      },
    );
  }

  Future generateQr() async {
    qrListData.clear();
    generateQrLoading(true);
    qrService()
        .then((value) {
          if (value.statusCode == 201 || value.statusCode == 200) {
            log(value.data.toString());
            qrGet();
            qrListData.value = (value.data as List)
                .map((item) => QrCodeModel.fromJson(item))
                .toList();
            Get.back();
            qrCount(1);
          } else {
            log(ApiException(value.data['message']).toString());
          }
        })
        .onError(
          (error, _) {
            log(_.toString());
            Utils.showError(error);
          },
        )
        .whenComplete(
          () => generateQrLoading(false),
        )
        .then((value) async {
          await createMultiplePdfs(qrListData);
        });
  }

  Future<DioResponse> usersService() async {
    return ApiServices().getMethod(
      ApiEndpoints.qr,
    );
  }

  Future qrGet() async {
    getQrLoading(true);
    usersService().then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        qrList(qrModelFromJson(value.data).toList());

        // Get.offAllNamed('/dashboard');
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => getQrLoading(false),
    );
  }

  Future<DioResponse> unlinkQrService(qrId) async {
    return ApiServices().patchMethod(
      ApiEndpoints.unlinkQr,
      data: {
        "qr_id": qrId,
      },
    );
  }

  Future unlinkQr(String qrId) async {
    unlinkQrService(qrId).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        qrGet();
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

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
  RxList<QrModel> qrListLinked = <QrModel>[].obs;
  RxList<QrModel> qrListNotLinked = <QrModel>[].obs;

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

  Rxn selectVehicleType = Rxn();

  RxBool isEditVehicleLoading = false.obs;

  RxBool updateEmergencyLoading = false.obs;

  RxBool emergencyClicked = false.obs;

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    qrGet();
    super.onInit();
  }

  RxBool getQrLoading = false.obs;
  RxBool generateQrLoading = false.obs;
  RxInt qrCount = 1.obs;
  TextEditingController qrCountController = TextEditingController(text: '1');

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
          removeCountryCode(qrList[index].emergencyContacts[0].phoneNumber);
    }
    if (qrList[index].emergencyContacts.length > 1) {
      emergencyNo2Controller.text =
          removeCountryCode(qrList[index].emergencyContacts[1].phoneNumber);
    }
    vehicleDetails.value = qrList[index].vehicleDetails;

    vehicleRegNumberController.text = qrList[index].vehicleDetails.licensePlate;
    vehicleMakeController.text = qrList[index].vehicleDetails.make;
    vehicleMakeController.text = qrList[index].vehicleDetails.make;
    vehicleModelController.text = qrList[index].vehicleDetails.model;
    ownerNameController.text = qrList[index].vehicleDetails.ownerName;

    ownerNumberController.text =
        removeCountryCode(qrList[index].vehicleDetails.ownerMobileNumber);
    selectVehicleType.value = qrList[index].vehicleDetails.vehicleType;
  }

  String removeCountryCode(String phoneNumber) {
    if (phoneNumber.startsWith('+91')) {
      return phoneNumber.substring(3);
    }
    return phoneNumber;
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
        List<QrModel> unlinkedItems = qrList
            .where((item) => item.vehicleDetails.vehicleLink == false)
            .toList();
        qrListNotLinked(unlinkedItems);

        List<QrModel> LinkedItems = qrList
            .where((item) => item.vehicleDetails.vehicleLink == true)
            .toList();

        qrListLinked(LinkedItems);

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
        "qrId": qrId,
      },
    );
  }

  Future unlinkQr(String qrId) async {
    print(qrId);
    unlinkQrService(qrId).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        Utils.showToast("QR code unlinked successfully");
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

  Future<DioResponse> deleteQrService(qrId) async {
    return ApiServices().deleteMethod(
      ApiEndpoints.deleteQr,
      data: {
        "qrId": qrId,
      },
    );
  }

  RxBool deleteQrLoading = false.obs;
  Future deleteQr(String qrId) async {
    deleteQrLoading(true);
    deleteQrService(qrId).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        Get.back();
        Utils.showToast("QR code deleted successfully");

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
      () => deleteQrLoading(false),
    );
  }

  Future getEditVehicle() async {
    isEditVehicleLoading(true);
    ApiServices()
        .putMethod("${ApiEndpoints.editVehicle}${vehicleDetails.value!.id}",
            data: {
              "ownerName": ownerNameController.text.trim(),
              "vehicleType": selectVehicleType.value,
              "ownerMobileNumber": "+91${ownerNumberController.text}",
              "make": vehicleMakeController.text.trim(),
              "model": vehicleModelController.text.trim(),
              "year": 1,
              "licensePlate": vehicleRegNumberController.text.trim(),
            })
        .then(
          (value) {
            if (value.statusCode == 201 || value.statusCode == 200) {
              log(value.data.toString());
              qrGet();
              Get.back();
              Get.back();
              Utils.showToast("Vehicle updated successfully");
            } else {
              log(ApiException(value.data['message']).toString());
            }
          },
        )
        .onError(
          (error, stackTrace) => Utils.showError(error),
        )
        .whenComplete(
          () => isEditVehicleLoading(false),
        );
  }

  Future<DioResponse> updateEmergencyContactService(String id) async {
    return ApiServices().patchMethod(
      "${ApiEndpoints.updateEmergencyContact}/$id",
      data: {
        "emergencyContacts": [
          {
            if (emergencyNo1Controller.text.isNotEmpty)
              "phoneNumber": "+91${emergencyNo1Controller.text}",
          },
          {
            if (emergencyNo2Controller.text.isNotEmpty)
              "phoneNumber": "+91${emergencyNo2Controller.text}",
          }
        ]
      },
    );
  }

  Future updateEmergencyContact(String id) async {
    updateEmergencyLoading(true);
    await updateEmergencyContactService(id).then(
      (value) {
        if (value.statusCode == 201 || value.statusCode == 200) {
          log(value.data.toString());

          qrGet();
          emergencyClicked(false);
        } else {
          log(ApiException(value.data['message']).toString());
          Utils.showError(
            'Error',
            title: ApiException(value.data['message']).toString(),
          );
        }
      },
    ).onError(
      (error, _) {
        log(error.toString());
      },
    ).whenComplete(
      () {
        updateEmergencyLoading(false);
      },
    );
  }
}

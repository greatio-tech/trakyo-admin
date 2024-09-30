List<QrModel> qrModelFromJson(List list) =>
    List<QrModel>.from(list.map((x) => QrModel.fromJson(x)));

class QrModel {
  final VehicleDetails? vehicleDetails;
  final String id;
  final String code;
  final String baseUrl;
  final String owner;
  final String qrCodeData;
  // final List<dynamic> images;
  final List<EmergencyContact> emergencyContacts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  QrModel({
    required this.vehicleDetails,
    required this.id,
    required this.code,
    required this.baseUrl,
    required this.owner,
    required this.qrCodeData,
    // required this.images,
    required this.emergencyContacts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        vehicleDetails: json["vehicleDetails"] != null
            ? VehicleDetails.fromJson(json["vehicleDetails"])
            : null,
        id: json["_id"] ?? '',
        code: json["code"] ?? '',
        baseUrl: json["baseUrl"] ?? '',
        owner: json["owner"] ?? '',
        qrCodeData: json["qrCodeData"] ?? '',
        // images: json["images"] != null
        //     ? List<dynamic>.from(json["images"].map((x) => x))
        //     : [],
        emergencyContacts: json["emergencyContacts"] != null
            ? List<EmergencyContact>.from(json["emergencyContacts"]
                .map((x) => EmergencyContact.fromJson(x)))
            : [],
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        v: json["__v"] ?? 0,
      );
}

class EmergencyContact {
  final String phoneNumber;
  final String id;

  EmergencyContact({
    required this.phoneNumber,
    required this.id,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        phoneNumber: json["phoneNumber"] ?? '',
        id: json["_id"] ?? '',
      );
}

class VehicleDetails {
  final String make;
  final String model;
  final int year;
  final String licensePlate;
  final String vehicleType;

  VehicleDetails({
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.vehicleType,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
        make: json["make"] ?? '',
        model: json["model"] ?? '',
        year: json["year"] ?? 0,
        licensePlate: json["licensePlate"] ?? '',
        vehicleType: json["vehicleType"] ?? '',
      );
}

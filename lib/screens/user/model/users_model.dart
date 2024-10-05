List<UsersModel> usersModelFromJson(List list) =>
    List<UsersModel>.from(list.map((x) => UsersModel.fromJson(x)));

class UsersModel {
  final String id;
  final String phoneNumber;
  final String profilePicture;
  final String? refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime? dob;
  final String email;
  final String name;
  final List<QrCode> qrCodes;
  final List<Vehicle> vehicles;

  UsersModel({
    required this.id,
    required this.phoneNumber,
    required this.profilePicture,
    this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.dob,
    required this.email,
    required this.name,
    required this.qrCodes,
    required this.vehicles,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["_id"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        profilePicture: json["profilePicture"] ?? '',
        refreshToken: json["refreshToken"],
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        v: json["__v"] ?? 0,
        dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        qrCodes: json["qrCodes"] != null
            ? List<QrCode>.from(json["qrCodes"].map((x) => QrCode.fromJson(x)))
            : [],
        vehicles: json["vehicles"] != null
            ? List<Vehicle>.from(
                json["vehicles"].map((x) => Vehicle.fromJson(x)))
            : [],
      );
}

class QrCode {
  final String id;
  final String code;
  final String baseUrl;
  final String owner;
  final String qrCodeData;
  final List<dynamic> images;
  final List<EmergencyContact> emergencyContacts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? vehicleDetails;
  // final VehicleDetailsClass? vehicleDetails;

  QrCode({
    required this.id,
    required this.code,
    required this.baseUrl,
    required this.owner,
    required this.qrCodeData,
    required this.images,
    required this.emergencyContacts,
    required this.createdAt,
    required this.updatedAt,
    this.vehicleDetails,
  });

  factory QrCode.fromJson(Map<String, dynamic> json) => QrCode(
      id: json["_id"] ?? '',
      code: json["code"] ?? '',
      baseUrl: json["baseUrl"] ?? '',
      owner: json["owner"] ?? '',
      qrCodeData: json["qrCodeData"] ?? '',
      images: json["images"] != null
          ? List<dynamic>.from(json["images"].map((x) => x))
          : [],
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
      vehicleDetails: json["vehicleDetails"] ?? ""
      //  is Map<String, dynamic>
      //     ? VehicleDetailsClass.fromJson(json["vehicleDetails"])
      //     : null,
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

// class VehicleDetailsClass {
//   final String make;
//   final String model;
//   final int year;
//   final String licensePlate;
//   final String vehicleType;

//   VehicleDetailsClass({
//     required this.make,
//     required this.model,
//     required this.year,
//     required this.licensePlate,
//     required this.vehicleType,
//   });

//   factory VehicleDetailsClass.fromJson(Map<String, dynamic> json) =>
//       VehicleDetailsClass(
//         make: json["make"] ?? '',
//         model: json["model"] ?? '',
//         year: json["year"] ?? 0,
//         licensePlate: json["licensePlate"] ?? '',
//         vehicleType: json["vehicleType"] ?? '',
//       );
// }

class Vehicle {
  final String id;
  final String owner;
  final String ownerName;
  final String vehicleType;
  final String ownerMobileNumber;
  final String make;
  final String model;
  final int year;
  final String licensePlate;
  final bool vehicleLink;
  final QrCode? qrCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Vehicle({
    required this.id,
    required this.owner,
    required this.ownerName,
    required this.vehicleType,
    required this.ownerMobileNumber,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.vehicleLink,
    this.qrCode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"] ?? '',
        owner: json["owner"] ?? '',
        ownerName: json["ownerName"] ?? '',
        vehicleType: json["vehicleType"] ?? '',
        ownerMobileNumber: json["ownerMobileNumber"] ?? '',
        make: json["make"] ?? '',
        model: json["model"] ?? '',
        year: json["year"] ?? 0,
        licensePlate: json["licensePlate"] ?? '',
        vehicleLink: json["vehicleLink"] ?? false,
        qrCode: json["qrCode"] != null && json["qrCode"] is Map<String, dynamic>
            ? QrCode.fromJson(json["qrCode"])
            : null,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        v: json["__v"] ?? 0,
      );
}

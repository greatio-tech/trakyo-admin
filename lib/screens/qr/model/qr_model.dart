List<QrModel> qrModelFromJson(List list) =>
    List<QrModel>.from(list.map((x) => QrModel.fromJson(x)));

class QrModel {
  final VehicleDetails vehicleDetails;
  final String id;
  final String code;
  final String baseUrl;
  final Owner owner;
  final String qrCodeData;
  final List<dynamic> images;
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
    required this.images,
    required this.emergencyContacts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        vehicleDetails: VehicleDetails.fromJson(json["vehicleDetails"] ?? {}),
        id: json["_id"] ?? '',
        code: json["code"] ?? '',
        baseUrl: json["baseUrl"] ?? '',
        owner: Owner.fromJson(json["owner"] ?? {}),
        qrCodeData: json["qrCodeData"] ?? '',
        images: List<dynamic>.from((json["images"] ?? []).map((x) => x)),
        emergencyContacts: List<EmergencyContact>.from(
            (json["emergencyContacts"] ?? [])
                .map((x) => EmergencyContact.fromJson(x))),
        createdAt: DateTime.parse(
            json["createdAt"] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(
            json["updatedAt"] ?? DateTime.now().toIso8601String()),
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

class Owner {
  final String id;
  final String phoneNumber;
  final String profilePicture;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime dob;
  final String email;
  final String name;

  Owner({
    required this.id,
    required this.phoneNumber,
    required this.profilePicture,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.dob,
    required this.email,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        profilePicture: json["profilePicture"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
        createdAt: DateTime.parse(
            json["createdAt"] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(
            json["updatedAt"] ?? DateTime.now().toIso8601String()),
        v: json["__v"] ?? 0,
        dob: DateTime.parse(json["dob"] ?? DateTime.now().toIso8601String()),
        email: json["email"] ?? '',
        name: json["name"] ?? '',
      );
}

class VehicleDetails {
  final String id;
  final String make;
  final String model;
  final int year;
  final String licensePlate;
  final bool vehicleLink;

  final String vehicleType;
  final String ownerMobileNumber;
  final String ownerName;

  VehicleDetails({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.vehicleType,
    required this.ownerMobileNumber,
    required this.ownerName,
    required this.vehicleLink,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
        id: json["_id"] ?? '',
        make: json["make"] ?? '',
        model: json["model"] ?? '',
        year: json["year"] ?? 0,
        licensePlate: json["licensePlate"] ?? '',
        vehicleType: json["vehicleType"] ?? '',
        ownerMobileNumber: json["ownerMobileNumber"] ?? '',
        ownerName: json["ownerName"] ?? '',
        vehicleLink: json['vehicleLink'] ?? false,
      );
}

class QrCodeModel {
  final String? id;
  final String? qrCode;

  QrCodeModel({
    required this.id,
    required this.qrCode,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      id: json['code'] ?? '',
      qrCode: json['qrCodeData'] ?? '',
    );
  }
}
// class QrModel {
//   final VehicleDetails? vehicleDetails;
//   final String id;
//   final String code;
//   final String baseUrl;
//   final String owner;
//   final String qrCodeData;
//   // final List<dynamic> images;
//   final List<EmergencyContact> emergencyContacts;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int v;

//   QrModel({
//     required this.vehicleDetails,
//     required this.id,
//     required this.code,
//     required this.baseUrl,
//     required this.owner,
//     required this.qrCodeData,
//     // required this.images,
//     required this.emergencyContacts,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
//         vehicleDetails: json["vehicleDetails"] != null
//             ? VehicleDetails.fromJson(json["vehicleDetails"])
//             : null,
//         id: json["_id"] ?? '',
//         code: json["code"] ?? '',
//         baseUrl: json["baseUrl"] ?? '',
//         owner: json["owner"] ?? '',
//         qrCodeData: json["qrCodeData"] ?? '',
//         // images: json["images"] != null
//         //     ? List<dynamic>.from(json["images"].map((x) => x))
//         //     : [],
//         emergencyContacts: json["emergencyContacts"] != null
//             ? List<EmergencyContact>.from(json["emergencyContacts"]
//                 .map((x) => EmergencyContact.fromJson(x)))
//             : [],
//         createdAt: json["createdAt"] != null
//             ? DateTime.parse(json["createdAt"])
//             : DateTime.now(),
//         updatedAt: json["updatedAt"] != null
//             ? DateTime.parse(json["updatedAt"])
//             : DateTime.now(),
//         v: json["__v"] ?? 0,
//       );
// }

// class EmergencyContact {
//   final String phoneNumber;
//   final String id;

//   EmergencyContact({
//     required this.phoneNumber,
//     required this.id,
//   });

//   factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
//       EmergencyContact(
//         phoneNumber: json["phoneNumber"] ?? '',
//         id: json["_id"] ?? '',
//       );
// }

// class VehicleDetails {
//   final String make;
//   final String model;
//   final int year;
//   final String licensePlate;
//   final String vehicleType;

//   VehicleDetails({
//     required this.make,
//     required this.model,
//     required this.year,
//     required this.licensePlate,
//     required this.vehicleType,
//   });

//   factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
//         make: json["make"] ?? '',
//         model: json["model"] ?? '',
//         year: json["year"] ?? 0,
//         licensePlate: json["licensePlate"] ?? '',
//         vehicleType: json["vehicleType"] ?? '',
//       );
// }

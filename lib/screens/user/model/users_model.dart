List<UsersModel> usersModelFromJson(List list) =>
    List<UsersModel>.from(list.map((x) => UsersModel.fromJson(x)));

class UsersModel {
  final String id;
  final String phoneNumber;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime dob;
  final String email;
  final String name;
  final List<QrCode> qrCodes;
  final List<Vehicle> vehicles;

  UsersModel({
    required this.id,
    required this.phoneNumber,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.dob,
    required this.email,
    required this.name,
    required this.qrCodes,
    required this.vehicles,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    // Use the null-aware operator and provide defaults where necessary
    return UsersModel(
      id: json["_id"] ?? '',
      phoneNumber: json["phoneNumber"] ?? '',
      refreshToken: json["refreshToken"] ?? '',
      createdAt: json["createdAt"] != null
          ? DateTime.parse(json["createdAt"])
          : DateTime.now(),
      updatedAt: json["updatedAt"] != null
          ? DateTime.parse(json["updatedAt"])
          : DateTime.now(),
      v: json["__v"] ?? 0,
      dob: json["dob"] != null ? DateTime.parse(json["dob"]) : DateTime.now(),
      email: json["email"] ?? '',
      name: json["name"] ?? '',
      qrCodes: json["qrCodes"] != null
          ? List<QrCode>.from(json["qrCodes"].map((x) => QrCode.fromJson(x)))
          : [],
      vehicles: json["vehicles"] != null
          ? List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x)))
          : [],
    );
  }
}

class QrCode {
  final String id;
  final String code;
  final String baseUrl;
  final String owner;
  final String qrCodeData;
  final List<EmergencyContact> emergencyContacts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final VehicleDetails vehicleDetails;

  QrCode({
    required this.id,
    required this.code,
    required this.baseUrl,
    required this.owner,
    required this.qrCodeData,
    required this.emergencyContacts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.vehicleDetails,
  });

  factory QrCode.fromJson(Map<String, dynamic> json) {
    return QrCode(
      id: json["_id"] ?? '',
      code: json["code"] ?? '',
      baseUrl: json["baseUrl"] ?? '',
      owner: json["owner"] ?? '',
      qrCodeData: json["qrCodeData"] ?? '',
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
      vehicleDetails: json["vehicleDetails"] != null
          ? VehicleDetails.fromJson(json["vehicleDetails"])
          : VehicleDetails(
              make: '',
              model: '',
              year: 0,
              licensePlate: '',
              vehicleType: VehicleType.OTHERS),
    );
  }
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
  final VehicleType vehicleType;

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
        vehicleType:
            vehicleTypeValues.map[json["vehicleType"]] ?? VehicleType.OTHERS,
      );
}

enum VehicleType { OTHERS, THE_2_WHEELER, THE_3_WHEELER, THE_4_WHEELER }

final vehicleTypeValues = EnumValues({
  "Others": VehicleType.OTHERS,
  "2 Wheeler": VehicleType.THE_2_WHEELER,
  "3 Wheeler": VehicleType.THE_3_WHEELER,
  "4 Wheeler": VehicleType.THE_4_WHEELER,
});

class Vehicle {
  final String id;
  final String owner;
  final String ownerName;
  final VehicleType vehicleType;
  final String ownerMobileNumber;
  final String make;
  final String model;
  final int year;
  final String licensePlate;
  final bool vehicleLink;
  final dynamic qrCode;
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
    required this.qrCode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"] ?? '',
        owner: json["owner"] ?? '',
        ownerName: json["ownerName"] ?? '',
        vehicleType:
            vehicleTypeValues.map[json["vehicleType"]] ?? VehicleType.OTHERS,
        ownerMobileNumber: json["ownerMobileNumber"] ?? '',
        make: json["make"] ?? '',
        model: json["model"] ?? '',
        year: json["year"] ?? 0,
        licensePlate: json["licensePlate"] ?? '',
        vehicleLink: json["vehicleLink"] ?? false,
        qrCode: json["qrCode"] ?? '',
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        v: json["__v"] ?? 0,
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

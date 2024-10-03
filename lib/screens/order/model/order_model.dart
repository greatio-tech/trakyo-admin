List<OrdersModel> OrderModelFromJson(List list) =>
    List<OrdersModel>.from(list.map((x) => OrdersModel.fromJson(x)));

class OrdersModel {
  final String id;
  final User user;
  final List<String> qrCodes;
  final int amount;
  final String currency;
  final String receipt;
  final String status;
  final String deliveryStatus;
  final AddressId addressId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  OrdersModel({
    required this.id,
    required this.user,
    required this.qrCodes,
    required this.amount,
    required this.currency,
    required this.receipt,
    required this.status,
    required this.deliveryStatus,
    required this.addressId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        qrCodes: List<String>.from(json["qrCodes"].map((x) => x)),
        amount: json["amount"],
        currency: json["currency"],
        receipt: json["receipt"],
        status: json["status"],
        deliveryStatus: json["deliveryStatus"],
        addressId: AddressId.fromJson(json["address_id"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class AddressId {
  final String id;
  final String userId;
  final String fullName;
  final String phoneNumber;
  final String buldingNumber;
  final String address;
  final String state;
  final String pincode;
  final String city;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  AddressId({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.buldingNumber,
    required this.address,
    required this.state,
    required this.pincode,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddressId.fromJson(Map<String, dynamic> json) => AddressId(
        id: json["_id"],
        userId: json["userId"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        buldingNumber: json["buldingNumber"],
        address: json["address"],
        state: json["state"],
        pincode: json["pincode"],
        city: json["city"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        profilePicture: json["profilePicture"],
        refreshToken: json["refreshToken"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        dob: DateTime.parse(json["dob"]),
        email: json["email"],
        name: json["name"],
      );
}

// class OrdersModel {
//   final String id;
//   final String user;
//   final List<String> qrCodes;
//   final int amount;
//   final String currency;
//   final String receipt;
//   final String status;
//   final String deliveryStatus;
//   // final String addressId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int v;
//   final Address addressId;

//   OrdersModel({
//     required this.id,
//     required this.user,
//     required this.qrCodes,
//     required this.amount,
//     required this.currency,
//     required this.receipt,
//     required this.status,
//     required this.deliveryStatus,
//     // required this.addressId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     required this.addressId,
//   });

//   factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
//         id: json["_id"],
//         user: json["user"],
//         qrCodes: List<String>.from(json["qrCodes"].map((x) => x)),
//         amount: json["amount"],
//         currency: json["currency"],
//         receipt: json["receipt"],
//         status: json["status"],
//         deliveryStatus: json["deliveryStatus"],
//         // addressId: json["address_id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         addressId: Address.fromJson(json["address_id"]),
//       );
// }

// class Address {
//   final String id;
//   final String userId;
//   final String fullName;
//   final String phoneNumber;
//   final String buldingNumber;
//   final String address;
//   final String state;
//   final String pincode;
//   final String city;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int v;

//   Address({
//     required this.id,
//     required this.userId,
//     required this.fullName,
//     required this.phoneNumber,
//     required this.buldingNumber,
//     required this.address,
//     required this.state,
//     required this.pincode,
//     required this.city,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         id: json["_id"],
//         userId: json["userId"],
//         fullName: json["fullName"],
//         phoneNumber: json["phoneNumber"],
//         buldingNumber: json["buldingNumber"],
//         address: json["address"],
//         state: json["state"],
//         pincode: json["pincode"],
//         city: json["city"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );
// }


// class OrdersModel {
//   final String id;
//   final String user;
//   final List<String> qrCodes;
//   final int amount;
//   final String currency;
//   final String receipt;
//   final String status;
//   final String deliveryStatus;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int v;

//   OrdersModel({
//     required this.id,
//     required this.user,
//     required this.qrCodes,
//     required this.amount,
//     required this.currency,
//     required this.receipt,
//     required this.status,
//     required this.deliveryStatus,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         id: json["_id"]??'',
//         user: json["user"]??'',
//         qrCodes: List<String>.from(json["qrCodes"].map((x) => x)),
//         amount: json["amount"]??0,
//         currency: json["currency"]??'',
//         receipt: json["receipt"]??'',
//         status: json["status"],
//         deliveryStatus: json["deliveryStatus"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );
// }

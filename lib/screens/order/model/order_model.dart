List<OrdersModel> orderModelFromJson(List list) =>
    List<OrdersModel>.from(list.map((x) => OrdersModel.fromJson(x)));

class OrdersModel {
  final String id;
  final String user;
  final List<String> qrCodes;
  final int amount;
  final String currency;
  final String receipt;
  final String status;
  final String deliveryStatus;
  final String addressId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final Address address;

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
    required this.address,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json["_id"],
        user: json["user"],
        qrCodes: List<String>.from(json["qrCodes"].map((x) => x)),
        amount: json["amount"],
        currency: json["currency"],
        receipt: json["receipt"],
        status: json["status"],
        deliveryStatus: json["deliveryStatus"],
        addressId: json["address_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: Address.fromJson(json["address"]),
      );
}

class Address {
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

  Address({
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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


// class OrderModel {
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

//   OrderModel({
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

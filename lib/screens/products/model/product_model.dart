List<ProductModel> productModelFromJson(List list) =>
    List<ProductModel>.from(list.map((x) => ProductModel.fromJson(x)));

class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

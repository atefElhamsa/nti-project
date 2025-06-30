class ProductModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int sales;
  final int quantity;
  final num totalPrice;
  bool isFavourite;

  ProductModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.sales,
    required this.quantity,
    required this.totalPrice,
    this.isFavourite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      images: List<String>.from(json['images']) ?? [],
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? 0,
      sales: json['sales'] ?? 0,
      quantity: json['quantity'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
    );
  }
}

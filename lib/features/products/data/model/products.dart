import '../../domain/entities/products.dart';

class ProductResponseModel {
  List<ProductsModel> products;

  ProductResponseModel({required this.products});

  factory ProductResponseModel.fromJson(List<dynamic> productsResponseData) {
    return ProductResponseModel(
      products: productsResponseData
          .map((dynamic product) => ProductsModel.fromJson(product))
          .toList(),
    );
  }
}

class ProductsModel extends ProductsEntity {
  final Rating rating;
  ProductsModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String category,
    required String image,
    required this.rating,
  }) : super(id: id, title: title, description: description, price: price, category: category, image: image,rating: rating);

  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] != null ? int.tryParse(map['id'].toString()) ?? 0 : 0,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      price: map['price'] != null ? (map['price'] is int ? (map['price'] as int).toDouble() : map['price'] as double) : 0.0,
      category: map['category'] ?? "",
      image: map['image'] ?? "",
      rating: map['rating'] != null ? Rating.fromJson(map['rating']) : Rating(rate: 0.0, count: 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }
}
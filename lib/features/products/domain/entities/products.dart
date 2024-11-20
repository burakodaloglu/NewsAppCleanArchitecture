import 'package:floor/floor.dart';

import '../../../../core/util/converter/rating_converter.dart';
import '../../data/model/rating.dart';

@entity
class ProductsEntity {
  @primaryKey
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  @TypeConverters([RatingConverter])
  final Rating rating;

  ProductsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsEntity.fromJson(Map<String, dynamic> json) {
    return ProductsEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
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
      'rating': rating.toJson(),
    };
  }
}

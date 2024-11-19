import 'dart:convert';
import 'package:floor/floor.dart';

import '../../features/products/data/model/rating.dart';

class RatingConverter extends TypeConverter<Rating, String> {
  @override
  Rating decode(String databaseValue) {
    final Map<String, dynamic> json = jsonDecode(databaseValue);
    return Rating.fromJson(json);
  }

  @override
  String encode(Rating value) {
    return jsonEncode(value.toJson());
  }
}

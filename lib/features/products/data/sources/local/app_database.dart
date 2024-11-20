import 'package:floor/floor.dart';
import 'package:products_app_clean_architecture/features/products/data/sources/local/DAO/products_dao.dart';

import '../../../../../core/util/converter/rating_converter.dart';
import '../../../domain/entities/products.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ProductsEntity])
abstract class AppDatabase extends FloorDatabase {
  ProductsDao get productsDao;
}


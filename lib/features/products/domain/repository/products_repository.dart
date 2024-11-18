import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import '../entities/products.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductsEntity>>> getProducts();
}

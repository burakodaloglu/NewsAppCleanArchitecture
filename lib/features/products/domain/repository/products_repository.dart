import 'package:products_app_clean_architecture/core/resources/data_state.dart';
import '../entities/products.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductsEntity>>> getProducts();

  Future<List<ProductsEntity>> getSavedProducts();

  Future<void> saveProducts(ProductsEntity products);

  Future<void> deleteProducts(ProductsEntity products);
}

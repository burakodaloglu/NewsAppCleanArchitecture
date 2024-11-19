import 'package:floor/floor.dart';
import 'package:products_app_clean_architecture/features/products/data/model/products.dart';
import 'package:products_app_clean_architecture/features/products/domain/entities/products.dart';

@dao
abstract class ProductsDao {
  @Query('SELECT * FROM ProductsEntity')
  Future<List<ProductsEntity>> getAllProducts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProduct(ProductsEntity productEntity);

  @delete
  Future<void> deleteProduct(ProductsEntity productEntity);
}

import 'package:products_app_clean_architecture/core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/products.dart';
import '../repository/products_repository.dart';

class GetProductsUseCase implements UseCase<DataState<List<ProductsEntity>>,void> {

  final ProductsRepository _productsRepository;
  GetProductsUseCase(this._productsRepository);

  @override
  Future<DataState<List<ProductsEntity>>> call({void params}) {
    return _productsRepository.getProducts();
  }

}
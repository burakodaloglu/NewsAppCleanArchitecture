import '../../../../core/usecases/usecase.dart';
import '../entities/products.dart';
import '../repository/products_repository.dart';

class GetSavedUseCase implements UseCase<List<ProductsEntity>, void> {
  final ProductsRepository _productsRepository;

  GetSavedUseCase(this._productsRepository);

  @override
  Future<List<ProductsEntity>> call({void params}) {
    return _productsRepository.getSavedProducts();
  }
}

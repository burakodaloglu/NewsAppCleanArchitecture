import 'package:products_app_clean_architecture/core/usecases/usecase.dart';
import 'package:products_app_clean_architecture/features/products/domain/entities/products.dart';

import '../repository/products_repository.dart';

class SaveProductUseCase implements UseCase<void, ProductsEntity> {
  final ProductsRepository _productsRepository;

  SaveProductUseCase(this._productsRepository);

  @override
  Future<void> call({ProductsEntity? params}) {
    return _productsRepository.saveProducts(params!);
  }
}

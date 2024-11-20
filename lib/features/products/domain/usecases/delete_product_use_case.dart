import 'package:products_app_clean_architecture/features/products/domain/entities/products.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/products_repository.dart';

class DeleteProductUseCase implements UseCase<void, ProductsEntity> {
  final ProductsRepository _productsRepository;

  DeleteProductUseCase(this._productsRepository);

  @override
  Future<void> call({ProductsEntity ? params}) {
    return _productsRepository.deleteProducts(params!);
  }
}

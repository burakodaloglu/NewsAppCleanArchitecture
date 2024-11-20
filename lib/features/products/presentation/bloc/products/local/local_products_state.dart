import 'package:equatable/equatable.dart';
import 'package:products_app_clean_architecture/features/products/domain/entities/products.dart';

abstract class LocalProductsState extends Equatable {
  final List<ProductsEntity>? products;
  const LocalProductsState({this.products});

  @override
  List<Object> get props => [products!];

}

class LocalProductsLoading extends LocalProductsState {
  const LocalProductsLoading();
}

class LocalProductsDone extends LocalProductsState {
  const LocalProductsDone(List<ProductsEntity> products) : super(products: products);
}
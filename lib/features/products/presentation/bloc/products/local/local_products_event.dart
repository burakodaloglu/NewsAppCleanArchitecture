import 'package:equatable/equatable.dart';

import '../../../../domain/entities/products.dart';

abstract class LocalProductsEvent extends Equatable {
  final ProductsEntity? product;

  const LocalProductsEvent({this.product});

  @override
  List<Object> get props => [product!];
}
class GetSavedProducts extends LocalProductsEvent {
  const GetSavedProducts();
}

class DeleteProduct extends LocalProductsEvent {
  const DeleteProduct(ProductsEntity product) : super(product: product);
}

class SaveProduct extends LocalProductsEvent {
  const SaveProduct(ProductsEntity product) : super(product: product);
}
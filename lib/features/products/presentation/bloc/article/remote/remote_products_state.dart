import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/entities/products.dart';

abstract class RemoteProductsState extends Equatable {
  final List<ProductsEntity> ? products;
  final DioError ? error;
  const RemoteProductsState({this.products, this.error});

  @override
  List<Object?> get props => [products, error];
}

class RemoteProductsLoading extends RemoteProductsState {
  const RemoteProductsLoading();
}

class RemoteProductsDone extends RemoteProductsState {
  const RemoteProductsDone(List<ProductsEntity> products) : super(products: products);
}

class RemoteProductsError extends RemoteProductsState {
  const RemoteProductsError(DioError error) : super(error: error);
}
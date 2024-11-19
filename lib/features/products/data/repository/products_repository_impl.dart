import 'dart:io';
import 'package:dio/dio.dart';
import 'package:products_app_clean_architecture/core/resources/data_state.dart';
import 'package:products_app_clean_architecture/features/products/data/model/products.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/products.dart';
import '../../domain/repository/products_repository.dart';
import '../sources/remote/products_api_service.dart';
import 'dart:convert';

class ProductRepositoryImpl implements ProductsRepository {
  final ProductApiService _newsApiService;

  ProductRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ProductsEntity>>> getProducts() async {
    try {
      final httpResponse = await _newsApiService.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // Gelen veriyi List<ProductsEntity> formatına dönüştür
        final data = (httpResponse.response.data as List<dynamic>)
            .map((item) => ProductsEntity.fromJson(item))
            .toList();

        return Success(data);
      } else {
        return Error(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioError catch (e) {
      return Error(e);
    }
  }
}

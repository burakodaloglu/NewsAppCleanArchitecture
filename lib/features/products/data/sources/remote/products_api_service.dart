import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../../model/products.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: productsApiBaseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/products')
  Future<HttpResponse<ProductResponseModel>> getProducts();
}

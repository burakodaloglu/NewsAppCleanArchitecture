import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/article/remote/remote_products_bloc.dart';

import 'features/products/data/repository/products_repository_impl.dart';
import 'features/products/data/sources/local/app_database.dart';
import 'features/products/data/sources/remote/products_api_service.dart';
import 'features/products/domain/repository/products_repository.dart';
import 'features/products/domain/usecases/get_products_use_case.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//Database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));
  sl.registerSingleton<ProductsRepository>(ProductRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteProductsBloc>(() => RemoteProductsBloc(sl()));
}

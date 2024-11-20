import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app_clean_architecture/features/products/domain/usecases/get_saved_use_case.dart';

import '../../../../domain/usecases/delete_product_use_case.dart';
import '../../../../domain/usecases/save_product_use_case.dart';
import 'local_products_event.dart';
import 'local_products_state.dart';

class LocalProductsBloc extends Bloc<LocalProductsEvent, LocalProductsState> {
  final GetSavedUseCase _getSavedUseCase;
  final SaveProductUseCase _saveProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  LocalProductsBloc(this._getSavedUseCase, this._saveProductUseCase,
      this._deleteProductUseCase)
      : super(const LocalProductsLoading()){
    on<GetSavedProducts>(onGetSavedProducts);
    on<DeleteProduct>(onDeleteProduct);
    on<SaveProduct>(onSaveProduct);
  }

  void onGetSavedProducts(GetSavedProducts event,Emitter<LocalProductsState> emmit) async {
    final products = await _getSavedUseCase();
    emit(LocalProductsDone(products));
  }

  void onDeleteProduct(
      DeleteProduct deleteProduct, Emitter<LocalProductsState> emmit) async {
    await _deleteProductUseCase(params: deleteProduct.product);
    final products=await _getSavedUseCase();
    emmit(LocalProductsDone(products));
  }

  void onSaveProduct(SaveProduct saveProduct, Emitter<LocalProductsState> emmit) async {
    await _saveProductUseCase(params: saveProduct.product);
    final products=await _getSavedUseCase();
    emmit(LocalProductsDone(products));
  }

}

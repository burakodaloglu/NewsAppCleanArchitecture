import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app_clean_architecture/config/routes/router.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/remote/remote_products_bloc.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/appbar_widget.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/products_widget.dart';
import '../../bloc/products/remote/remote_products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppbarWidget(title: "Products"),
      body: _buildBody(),
    );
  }
  

  _buildBody() {
    return BlocBuilder<RemoteProductsBloc, RemoteProductsState>(
      builder: (_, state) {
        if (state is RemoteProductsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteProductsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteProductsDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: ProductsWidget(product: state.products![index]));
            },
            itemCount: state.products!.length,
          );
        }
        return const SizedBox(); // or return any other default widget
      },
    );
  }
}

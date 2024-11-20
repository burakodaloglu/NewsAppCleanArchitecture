import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app_clean_architecture/core/util/navigation/router.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/remote/remote_products_bloc.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/products_widget.dart';
import '../../bloc/products/remote/remote_products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_appBar(context),
      body: _buildBody(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Products",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () => context.push(AppRouter.cart),
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        )
      ],
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
                  onTap: () => context.push(AppRouter.productsDetail,
                      extra: state.products![index]),
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
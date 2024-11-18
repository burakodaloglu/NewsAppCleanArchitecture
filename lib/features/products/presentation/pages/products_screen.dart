import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/products/presentation/bloc/article/remote/remote_products_bloc.dart';
import 'package:news_app_clean_architecture/features/products/presentation/widgets/products_widget.dart';

import '../bloc/article/remote/remote_products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Products",
        style: TextStyle(color: Colors.black),
      ),
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
              return ProductsWidget(product: state.products![index]);
            },
            itemCount: state.products!.length,
          );
        }
        // Add a default return statement to handle unexpected state types
        return const SizedBox(); // or return any other default widget
      },
    );
  }
}

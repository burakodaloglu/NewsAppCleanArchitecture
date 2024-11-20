import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app_clean_architecture/features/products/domain/entities/products.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/local/local_products_event.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/local/local_products_state.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/cart_widget.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/products_widget.dart';

import '../../../../../injection_container.dart';
import '../../bloc/products/local/local_products_bloc.dart';

class CartProductScreen extends StatelessWidget {
  const CartProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<LocalProductsBloc>()
        ..add(const GetSavedProducts()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalProductsBloc, LocalProductsState>(
      builder: (context, state) {
        if (state is LocalProductsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalProductsDone) {
          return _buildArticlesList(state.products!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<ProductsEntity> products) {
    if (products.isEmpty) {
      return const Center(
          child: Text(
            'NO SAVED PRODUCTS',
            style: TextStyle(color: Colors.black),
          ));
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CartWidget(
          product: products[index],
          isRemovable: true,
          onRemove: (){
            BlocProvider.of<LocalProductsBloc>(context).add(DeleteProduct(products[index]));
          },
          //onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }
}

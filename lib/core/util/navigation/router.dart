import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app_clean_architecture/features/products/presentation/pages/cart/cart_product_screen.dart';
import 'package:products_app_clean_architecture/features/products/presentation/pages/home/products_screen.dart';

import '../../../features/products/domain/entities/products.dart';
import '../../../features/products/presentation/bloc/products/local/local_products_bloc.dart';
import '../../../features/products/presentation/pages/detail/product_detail_screen.dart';
import '../../../injection_container.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static const String products = '/';

  static const String detail = 'productsDetail';
  static const String productsDetail = '/productsDetail';

  static const String cart = '/cart';
}

final router = GoRouter(
    navigatorKey: _routerKey,
    initialLocation: AppRouter.products,
    routes: [
      GoRoute(
          path: AppRouter.products,
          builder: (context, state) => const ProductsScreen(),
          routes: [
            GoRoute(
              path: AppRouter.detail,
              builder: (context, state) {
                final product = state.extra as ProductsEntity;
                return BlocProvider(
                  create: (_) => LocalProductsBloc(sl(), sl(), sl()),
                  child: ProductDetailScreen(product: product),
                );
              },
            ),
          ]
      ),
      GoRoute(
        path: AppRouter.cart,
        builder: (context, state) => const CartProductScreen(),
      ),
    ]
);

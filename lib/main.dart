import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/products/presentation/bloc/article/remote/remote_products_bloc.dart';
import 'package:news_app_clean_architecture/features/products/presentation/bloc/article/remote/remote_products_event.dart';
import 'package:news_app_clean_architecture/features/products/presentation/pages/products_screen.dart';
import 'package:news_app_clean_architecture/injection_container.dart';

import 'config/theme/app_themes.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteProductsBloc>(
      create: (context)=> sl()..add(const GetProducts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const ProductsScreen(),
      ),
    );
  }
}
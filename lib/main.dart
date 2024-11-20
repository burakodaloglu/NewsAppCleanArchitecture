import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/remote/remote_products_bloc.dart';
import 'package:products_app_clean_architecture/features/products/presentation/bloc/products/remote/remote_products_event.dart';
import 'package:products_app_clean_architecture/injection_container.dart';

import 'config/theme/app_themes.dart';
import 'core/util/navigation/router.dart';
import 'features/products/presentation/bloc/products/local/local_products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocalProductsBloc(sl(), sl(), sl())),
        BlocProvider(create: (_) => sl<RemoteProductsBloc>()..add(const GetProducts())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: theme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;


  const AppbarWidget(
      {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500,
            color: Colors.black
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => context.push(AppRouter.cart),
            icon: const Icon(Icons.shopping_cart_outlined,color: Colors.black,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
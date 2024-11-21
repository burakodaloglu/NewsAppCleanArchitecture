import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:products_app_clean_architecture/features/products/presentation/widgets/appbar_widget.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/products.dart';
import '../../bloc/products/local/local_products_bloc.dart';
import '../../bloc/products/local/local_products_event.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsEntity product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalProductsBloc>(),
      child: Flexible(
        child: Scaffold(
          appBar: AppbarWidget(title: product.title),
          body: _buildBody(),
          floatingActionButton: _buildAddToCartButton(context),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),
          const SizedBox(height: 16),
          _buildProductDetails(),
          const SizedBox(height: 24),
          _buildProductDescription(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Kenar boşlukları
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(product.image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }


  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Title
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Product Price
          Row(
            children: [
              const Icon(Ionicons.cash_outline, size: 20),
              const SizedBox(width: 8),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Product Rating
          Row(
            children: [
              const Icon(Ionicons.star_outline, size: 20, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                '${product.rating.rate} (${product.rating.count} reviews)',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        product.description,
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        BlocProvider.of<LocalProductsBloc>(context).add(SaveProduct(product));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added to cart!')),
        );
      },
      label: const Text(
        "Add to Cart",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      icon: const Icon(Ionicons.cart_outline, color: Colors.white),
      backgroundColor: Colors.blue,
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/util/navigation/router.dart';
import '../../domain/entities/products.dart';

class CartWidget extends StatelessWidget {
  final ProductsEntity product;
  final bool isRemovable;
  final VoidCallback? onRemove;
  final bool isDetailsVisible;
  final VoidCallback? onDetails;

  const CartWidget({
    super.key,
    required this.product,
    this.isRemovable = false,
    this.onRemove,
    this.isDetailsVisible = false,
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.push(AppRouter.productsDetail, extra: product),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildImage(context),
                Expanded(
                  child: _buildTitleAndDetails(context),
                ),
                if (isRemovable) _buildRemoveButton(context),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.image,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                image:
                DecorationImage(image: imageProvider, fit: BoxFit.contain)),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
          child: const CupertinoActivityIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Mulish',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.money, size: 16),
                const SizedBox(width: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star_rate, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  product.rating.rate.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRemoveButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: onRemove,
    );
  }
}

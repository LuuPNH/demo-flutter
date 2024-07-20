import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        height: 160.0,
        child: Row(
          children: [
            Expanded(flex: 2, child: _imageProduct(product.thumbnail)),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4.0),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Expanded(child: SizedBox()),
                    Text('${product.price} \$', style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _imageProduct(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const Icon(Icons.error_outline),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}

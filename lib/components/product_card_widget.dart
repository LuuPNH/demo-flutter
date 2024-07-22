import 'package:burningbros/navigation/router_name.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final Function(bool)? callBackNeedUpdate;

  const ProductCardWidget({
    super.key,
    required this.product,
    this.callBackNeedUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          final res = await GoRouter.of(context).push(RouterName.productDetail, extra: product);
          if (res != null && res is Product) {
            callBackNeedUpdate?.call(true);
          }
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: 160.0,
          child: Row(
            children: [
              Expanded(flex: 2, child: _imageProduct(product.thumbnail)),
              const SizedBox(width: 8.0),
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

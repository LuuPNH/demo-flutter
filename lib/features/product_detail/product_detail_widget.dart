import 'package:burningbros/base/base_bloc/base_widget.dart';
import 'package:burningbros/di/di.dart';
import 'package:burningbros/features/product_detail/product_detail_bloc.dart';
import 'package:burningbros/resources/app_colors.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../utils/dialog_utils.dart';

class ProductDetailWidget extends StatefulWidget {
  final Product product;

  const ProductDetailWidget({super.key, required this.product});

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends BaseWidget<ProductDetailBloc, ProductDetailWidget> {
  @override
  ProductDetailBloc get getBloc => ProductDetailBloc(widget.product, getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) => bloc,
      child: BlocListener<ProductDetailBloc, ProductDetailState>(
        listenWhen: (p, c) => c.error != null,
        listener: (context, state) => DialogUtils.showErrorDialog(context, state.error.toString()),
        child: PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => GoRouter.of(context).pop(bloc.state.product),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              actions: [
                BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  buildWhen: (p, c) => p.product != c.product,
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () => addEvent(FavoriteProductEvent()),
                      icon: Icon(
                        state.product.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                        size: 28.0,
                        color: state.product.isFavorite ? AppColors.enableHeart : null,
                      ),
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              buildWhen: (_, __) => false,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Image.network(
                          state.product.thumbnail,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error_outline),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CupertinoActivityIndicator());
                          },
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(state.product.title, style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(height: 4.0),
                      Text(
                        state.product.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 16.0),
                      Text('${state.product.price} \$',
                          style: Theme.of(context).textTheme.headlineLarge)
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

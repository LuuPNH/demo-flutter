import 'package:burningbros/base/base_bloc/base_widget.dart';
import 'package:burningbros/features/favorite_products/favorite_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/product_card_widget.dart';
import '../../generated/l10n.dart';
import '../../resources/app_const.dart';
import '../../utils/dialog_utils.dart';

class FavoriteProductsWidget extends StatefulWidget {
  const FavoriteProductsWidget({super.key});

  @override
  State<FavoriteProductsWidget> createState() => _FavoriteProductsWidgetState();
}

class _FavoriteProductsWidgetState
    extends BaseWidget<FavoriteProductsBloc, FavoriteProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteProductsBloc, FavoriteProductsState>(
      bloc: bloc,
      listenWhen: (p, c) => c.error != null,
      listener: (context, state) => DialogUtils.showErrorDialog(context, state.error.toString()),
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).listFavorite),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: state.listProducts.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppConstant.spacingItemInList),
          itemBuilder: (_, i) => ProductCardWidget(
            key: ValueKey(state.listProducts[i].id),
            product: state.listProducts[i],
            callBackNeedUpdate: (value) {
              if (value) {
                addEvent(UpdateListFavoriteProductsEvent());
              }
            },
          ),
        ),
      ),
    );
  }
}

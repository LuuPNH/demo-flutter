import 'package:burningbros/features/favorite_products/favorite_products_widget.dart';
import 'package:burningbros/features/product_detail/product_detail_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/main_widget.dart';
import 'router_name.dart';

class RouterConfig {
  static final routeConfig = GoRouter(
    initialLocation: RouterName.mainWidget,
    routes: <RouteBase>[
      GoRoute(
        path: RouterName.mainWidget,
        name: RouterName.mainWidget,
        builder: (BuildContext context, GoRouterState state) => const MainWidget(),
      ),
      GoRoute(
        path: RouterName.listFavoriteProducts,
        name: RouterName.listFavoriteProducts,
        builder: (BuildContext context, GoRouterState state) {
          return const FavoriteProductsWidget();
        },
      ),
      GoRoute(
        path: RouterName.productDetail,
        name: RouterName.productDetail,
        builder: (BuildContext context, GoRouterState state) {
          final pro = state.extra as Product;
          return ProductDetailWidget(product: pro, key: ValueKey(pro.id));
        },
      ),
    ],
  );
}

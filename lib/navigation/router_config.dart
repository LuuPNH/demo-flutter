import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/main_widget/main_widget.dart';
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
    ],
  );
}

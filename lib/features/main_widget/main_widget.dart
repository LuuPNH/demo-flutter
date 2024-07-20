import 'package:burningbros/base/base_bloc/base_event.dart';
import 'package:burningbros/resources/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../app/theme.dart';
import '../../base/base_bloc/base_widget.dart';
import '../../components/appbar_search_widget.dart';
import '../../components/no_data_widget.dart';
import '../../components/product_card_widget.dart';
import '../../generated/l10n.dart';
import '../../config/bloc_observer.dart';
import '../../di/di.dart' as di;
import '../../navigation/router_config.dart' as navigation;
import '../../utils/dialog_utils.dart';
import 'main_bloc.dart';

void loadApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.configureInjection(env);

  Bloc.observer = AppBlocObserver();
  runApp(MaterialApp.router(
    routerConfig: navigation.RouterConfig.routeConfig,
    theme: Application.themeMode(),
    localizationsDelegates: const [
      S.delegate,
    ],
    supportedLocales: const [
      Locale('en', 'US'), // English
      Locale('vi', 'VN'), // Viet Nam
      // ... other locales the app supports
    ],
    debugShowCheckedModeBanner: false,
  ));
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends BaseWidget<MainBloc, MainWidget> {
  final _searchController = TextEditingController();
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => bloc,
      child: MultiBlocListener(
        listeners: [
          _onAddListenerError(),
          _onAddListenerRefreshProducts(),
          _onAddListenerLoadMoreProducts(),
        ],
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBarSearchWidget(
                    controller: _searchController,
                    loadingWidget: _buildLoadingSearch(),
                  ),
                  Expanded(child: _buildBody())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSearch() {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (p, c) => p.isLoadingSearch != c.isLoadingSearch,
      builder: (_, state) =>
          state.isLoadingSearch ? const CupertinoActivityIndicator() : const SizedBox(),
    );
  }

  Widget _buildBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.only(
        top: 16.0,
        left: AppConstant.primaryPadding,
        right: AppConstant.primaryPadding,
      ),
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (p, c) => !c.isFirstLoad || p.products != c.products,
        builder: (_, state) {
          if (state.isFirstLoad) {
            return const Align(alignment: Alignment.topCenter, child: CupertinoActivityIndicator());
          }
          if (state.products?.items?.isEmpty ?? false) {
            return const NoDataWidget();
          }
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: state.products!.canLoadMore,
            onLoading: () => addEvent(LoadMoreProductsEvent()),
            onRefresh: () => addEvent(RefreshEvent()),
            child: ListView.separated(
              itemCount: state.products!.items!.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppConstant.spacingItemInList),
              itemBuilder: (_, i) => ProductCardWidget(product: state.products!.items![i]),
            ),
          );
        },
      ),
    );
  }

  //   -------- Listener -------- //

  ///Listen show error dialog
  BlocListener _onAddListenerError() {
    return BlocListener<MainBloc, MainState>(
      bloc: bloc,
      listenWhen: (p, c) => c.error != null,
      listener: (context, state) => DialogUtils.showErrorDialog(context, state.error.toString()),
    );
  }

  ///Listen turn on/off header refresh list item
  BlocListener _onAddListenerRefreshProducts() {
    return BlocListener<MainBloc, MainState>(
      bloc: bloc,
      listenWhen: (p, c) => !c.isLoadingRefresh,
      listener: (context, state) {
        if (!state.isLoadingRefresh) {
          _refreshController.refreshCompleted();
        }
      },
    );
  }

  ///Listen turn on/off header load more list item
  BlocListener _onAddListenerLoadMoreProducts() {
    return BlocListener<MainBloc, MainState>(
      bloc: bloc,
      listenWhen: (p, c) => !c.isLoadingLoadMore,
      listener: (context, state) {
        if (!state.isLoadingLoadMore) {
          _refreshController.loadComplete();
        }
      },
    );
  }
}

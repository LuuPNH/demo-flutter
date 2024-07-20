import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/theme.dart';
import '../../base/base_bloc/base_widget.dart';
import '../../components/appbar_search_widget.dart';
import '../../components/no_data_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => bloc,
      child: MultiBlocListener(
        listeners: [
          BlocListener<MainBloc, MainState>(
            bloc: bloc,
            listenWhen: (p, c) => c.error != null,
            listener: (context, state) =>
                DialogUtils.showErrorDialog(context, state.error.toString()),
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBarSearchWidget(
                      controller: _searchController,
                      loadingWidget: _buildLoadingSearch(),
                    ),
                    _buildBody()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSearch() {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (_, state) =>
          state.isLoading ? const CupertinoActivityIndicator() : const SizedBox(),
    );
  }

  Widget _buildBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.only(top: 16.0),
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (p, c) => !c.isFirstLoad || p.products != c.products,
        builder: (_, state) {
          if (state.isFirstLoad) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.products?.items?.isEmpty ?? false) {
            return const NoDataWidget();
          }
          return const SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:titans_crypto/bloc/chart/chart_bloc.dart';
import 'package:titans_crypto/bloc/chart14d/chart_bloc_14d.dart';
import 'package:titans_crypto/bloc/chart30d/chart_bloc_30d.dart';
import 'package:titans_crypto/bloc/chart7d/chart_bloc_7d.dart';
import 'package:titans_crypto/bloc/coin/coin_bloc.dart';
import 'package:titans_crypto/injection.dart' as di;
import 'package:titans_crypto/logic/app_logic.dart';
import 'package:titans_crypto/view/styles/styles.dart';
import 'package:titans_crypto/view/app_scaffold.dart';
import 'package:titans_crypto/view/router.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  di.init();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoinsBloc>(create: (context) => di.locator<CoinsBloc>()),
        BlocProvider<ChartBloc>(create: (context) => di.locator<ChartBloc>()),
        BlocProvider<ChartBloc7D>(create: (context) => di.locator<ChartBloc7D>()),
        BlocProvider<ChartBloc14D>(create: (context) => di.locator<ChartBloc14D>()),
        BlocProvider<ChartBloc30D>(create: (context) => di.locator<ChartBloc30D>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Titans Crypto',
        theme: ThemeData(
            fontFamily: $styles.text.bodyMedium.fontFamily, useMaterial3: true),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
AppStyle get $styles => TitansCryptoAppScaffold.style;

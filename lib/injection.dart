import 'package:get_it/get_it.dart';
import 'package:titans_crypto/bloc/chart/chart_bloc.dart';
import 'package:titans_crypto/bloc/chart14d/chart_bloc_14d.dart';
import 'package:titans_crypto/bloc/chart30d/chart_bloc_30d.dart';
import 'package:titans_crypto/bloc/chart7d/chart_bloc_7d.dart';
import 'package:titans_crypto/bloc/coin/coin_bloc.dart';
import 'package:titans_crypto/logic/app_logic.dart';
import 'package:http/http.dart' as http;
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/logic/service/api_service.dart';

final locator = GetIt.instance;

void init() {
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());

  //bloc
  locator.registerFactory(() => CoinsBloc(
        repository: locator(),
      ));

  locator.registerFactory(() => ChartBloc(repository: locator(),));

  locator.registerFactory(() => ChartBloc7D(repository: locator(),));

  locator.registerFactory(() => ChartBloc14D(repository: locator(),));

  locator.registerFactory(() => ChartBloc30D(repository: locator(),));

  //api service
  locator.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(client: locator()));

  //repository

  locator.registerLazySingleton<Repository>(
      () => RepositoryImpl(apiService: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}

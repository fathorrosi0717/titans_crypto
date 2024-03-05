import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/service/api_service.dart';
import 'package:titans_crypto/model/chart_model.dart';
import 'package:titans_crypto/model/coin_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<NetworkExceptions, List<CoinModel>>> getCoins();
  Future<Either<NetworkExceptions, ChartModel>> getChart(
      String id, String days);
}

class RepositoryImpl implements Repository {
  final ApiService apiService;

  RepositoryImpl({required this.apiService});

  @override
  Future<Either<NetworkExceptions, List<CoinModel>>> getCoins() async {
    try {
      final result = await apiService.getCoins();
      const networkException = NetworkExceptions.unexpectedError();
      return result.when(
        success: (data) => Right(data!),
        failure: (error) => const Left(networkException),
      );
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, ChartModel>> getChart(
      String id, String days) async {
    try {
      final result = await apiService.getChart(id, days);
      const networkException = NetworkExceptions.unexpectedError();
      return result.when(
        success: (data) => Right(data!),
        failure: (error) => const Left(networkException),
      );
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }
}

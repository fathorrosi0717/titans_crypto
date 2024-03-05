import 'dart:convert';

import 'package:titans_crypto/logic/common/api_result.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/model/chart_model.dart';
import 'package:titans_crypto/model/coin_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<ApiResult<List<CoinModel>>> getCoins();
  Future<ApiResult<ChartModel>> getChart(String id, String days);
}

class ApiServiceImpl implements ApiService {
  final http.Client client;

  ApiServiceImpl({required this.client});

  final String _baseUrl = "https://api.coingecko.com/api/v3";

  @override
  Future<ApiResult<List<CoinModel>>> getCoins() async {
    try {
      final response = await client.get(Uri.parse(
          "$_baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=7&page=1&sparkline=true&price_change_percentage=1h%2C%2024h%2C%207d%2C%2014d%2C%2030d&locale=en"));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);

        List<CoinModel> coinModels = jsonList.map((model) {
          return CoinModel.fromJson(model);
        }).toList();

        return ApiResult.success(data: coinModels);
      } else {
        final networkException = NetworkExceptions.getHttpException(response);
        return ApiResult.failure(error: networkException);
      }
    } catch (e) {
      final response = http.Response('', 500);
      final networkException = NetworkExceptions.getHttpException(response);
      return ApiResult.failure(error: networkException);
    }
  }

  @override
  Future<ApiResult<ChartModel>> getChart(String id, String days) async {
    try {
      final response = await client.get(Uri.parse(
          "$_baseUrl/coins/$id/market_chart?vs_currency=usd&days=$days"));

      if (response.statusCode == 200) {
        final chartModel = ChartModel.fromJson(jsonDecode(response.body));

        return ApiResult.success(data: chartModel);
      } else {
        final networkException = NetworkExceptions.getHttpException(response);
        return ApiResult.failure(error: networkException);
      }
    } catch (e) {
      final response = http.Response('', 500);
      final networkException = NetworkExceptions.getHttpException(response);
      return ApiResult.failure(error: networkException);
    }
  }
}

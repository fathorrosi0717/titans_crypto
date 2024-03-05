import 'package:equatable/equatable.dart';

class ChartModel extends Equatable {
  const ChartModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  final List<List<double>> prices;
  final List<List<double>> marketCaps;
  final List<List<double>> totalVolumes;

  factory ChartModel.fromJson(Map<String, dynamic> json) {
    return ChartModel(
      prices: json["prices"] == null
          ? []
          : List<List<double>>.from(json["prices"].map((x) =>
              x == null ? [] : List<double>.from(x.map((x) => x.toDouble())))),
      marketCaps: json["market_caps"] == null
          ? []
          : List<List<double>>.from(json["market_caps"].map((x) =>
              x == null ? [] : List<double>.from(x.map((x) => x.toDouble())))),
      totalVolumes: json["total_volumes"] == null
          ? []
          : List<List<double>>.from(json["total_volumes"].map((x) =>
              x == null ? [] : List<double>.from(x.map((x) => x.toDouble())))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "prices": prices.map((x) => [x[0].toInt(), x[1]]).toList(),
      "market_caps": marketCaps.map((x) => [x[0].toInt(), x[1]]).toList(),
      "total_volumes": totalVolumes.map((x) => [x[0].toInt(), x[1]]).toList(),
    };
  }

  @override
  List<Object?> get props => [
        prices,
        marketCaps,
        totalVolumes,
      ];
}

import 'package:equatable/equatable.dart';

class CoinModel extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCapRank;
  final double totalVolume;
  final double high24H;
  final double low24H;
  final double priceChange24H;
  final double marketCapChangePercentage24H;
  final SparklineIn7D sparklineIn7D;

  const CoinModel(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCapRank,
      required this.totalVolume,
      required this.high24H,
      required this.low24H,
      required this.priceChange24H,
      required this.marketCapChangePercentage24H,
      required this.sparklineIn7D});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice:
          (json["current_price"] as num).toDouble(), // Ubah tipe data ke double
      marketCapRank: json["market_cap_rank"],
      totalVolume:
          (json["total_volume"] as num).toDouble(), // Ubah tipe data ke double
      high24H: (json["high_24h"] as num).toDouble(), // Ubah tipe data ke double
      low24H: (json["low_24h"] as num).toDouble(), // Ubah tipe data ke double
      priceChange24H: (json["price_change_24h"] as num)
          .toDouble(), // Ubah tipe data ke double
      marketCapChangePercentage24H:
          (json["market_cap_change_percentage_24h"] as num)
              .toDouble(), // Ubah tipe data ke double
      sparklineIn7D: SparklineIn7D.fromJson(json["sparkline_in_7d"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap_rank": marketCapRank,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "sparkline_in_7d": sparklineIn7D.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCapRank,
        totalVolume,
        high24H,
        low24H,
        priceChange24H,
        marketCapChangePercentage24H,
        sparklineIn7D
      ];
}

class SparklineIn7D extends Equatable {
  const SparklineIn7D({
    required this.price,
  });

  final List<double> price;

  factory SparklineIn7D.fromJson(Map<String, dynamic> json) {
    return SparklineIn7D(
      price: json["price"] == null
          ? []
          : List<double>.from(json["price"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "price": price.map((x) => x).toList(),
      };

  @override
  List<Object?> get props => [
        price,
      ];
}

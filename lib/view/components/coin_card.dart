import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/model/coin_model.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.width,
    required this.coin,
  });

  final double width;
  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: $styles.colors.green,
      onTap: () {
        context.push('/coinDetail', extra: coin);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 87,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xFF333333),
            borderRadius: BorderRadius.circular(17)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: 40, width: 40, child: Image.network(coin.image))),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: $styles.text.titleMedium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    coin.symbol,
                    style: $styles.text.bodyMedium.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                  width: 100,
                  height: 57,
                  child: Sparkline(
                    data: coin.sparklineIn7D.price,
                    lineWidth: 2.0,
                    lineColor: coin.marketCapChangePercentage24H >= 0
                        ? $styles.colors.green
                        : Colors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.2],
                      colors: coin.marketCapChangePercentage24H >= 0
                          ? [Colors.green, Colors.green.shade100]
                          : [Colors.red, Colors.red.shade100],
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${coin.currentPrice}',
                    style: $styles.text.titleMedium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        coin.marketCapChangePercentage24H >= 0
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: coin.marketCapChangePercentage24H >= 0
                            ? $styles.colors.green
                            : Colors.red,
                      ),
                      Text(
                          '${coin.marketCapChangePercentage24H.toStringAsFixed(0)}%',
                          style: $styles.text.titleMedium.copyWith(
                              color: coin.marketCapChangePercentage24H >= 0
                                  ? $styles.colors.green
                                  : Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

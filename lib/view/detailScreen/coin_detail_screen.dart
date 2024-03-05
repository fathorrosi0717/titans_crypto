import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:titans_crypto/bloc/chart/chart_bloc.dart';
import 'package:titans_crypto/bloc/chart14d/chart_bloc_14d.dart';
import 'package:titans_crypto/bloc/chart30d/chart_bloc_30d.dart';
import 'package:titans_crypto/bloc/chart7d/chart_bloc_7d.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/model/coin_model.dart';
import 'package:titans_crypto/view/components/line_chart.dart';

class CoinDetailScreen extends StatefulWidget {
  const CoinDetailScreen({
    super.key,
    required this.coin,
  });

  final CoinModel coin;

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ChartBloc>(context)
        .add(GetChart(id: widget.coin.id, days: '1'));
    BlocProvider.of<ChartBloc7D>(context)
        .add(GetChart7D(id: widget.coin.id, days: '7'));
    BlocProvider.of<ChartBloc14D>(context)
        .add(GetChart14D(id: widget.coin.id, days: '14'));
    BlocProvider.of<ChartBloc30D>(context)
        .add(GetChart30D(id: widget.coin.id, days: '30'));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: $styles.colors.black,
      appBar: AppBar(
        backgroundColor: $styles.colors.black,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: $styles.colors.white,
        ),
        actions: [
          Icon(
            Icons.search,
            color: $styles.colors.white,
          ),
          const SizedBox(
            width: 6,
          ),
          Icon(
            Icons.upload,
            color: $styles.colors.white,
          ),
          const SizedBox(
            width: 6,
          ),
          Icon(
            Icons.star_border,
            color: $styles.colors.white,
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coin.name,
                        style: $styles.text.titleLarge
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 24,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFF333333),
                            borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.coin.symbol,
                            style: $styles.text.titleMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(widget.coin.image),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: width,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF333333),
                    width: 1,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Curent Price',
                    style: $styles.text.labelMedium,
                  ),
                  Text(
                    '\$${widget.coin.currentPrice}',
                    style: $styles.text.titleLarge
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        widget.coin.marketCapChangePercentage24H >= 0
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: widget.coin.marketCapChangePercentage24H >= 0
                            ? $styles.colors.green
                            : Colors.red,
                      ),
                      Text(
                          '${widget.coin.marketCapChangePercentage24H.toString()}%',
                          style: $styles.text.titleMedium.copyWith(
                              color:
                                  widget.coin.marketCapChangePercentage24H >= 0
                                      ? $styles.colors.green
                                      : Colors.red)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: $styles.insets.md,
            ),
            SizedBox(
              width: width,
              height: 277,
              child: TabBarView(controller: _tabController, children: [
                BlocBuilder<ChartBloc, ChartState>(builder: (context, state) {
                  if (state is ChartLoading) {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: $styles.colors.green),
                    );
                  } else if (state is ChartLoaded) {
                    return LineChartWidget(chartModel: state.chart);
                  } else if (state is ChartError) {
                    return Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.error.toString(),
                          style: $styles.text.bodyMedium,
                        ));
                  } else {
                    return const SizedBox();
                  }
                }),
                BlocBuilder<ChartBloc7D, ChartState7D>(builder: (context, state) {
                  if (state is ChartLoading7D) {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: $styles.colors.green),
                    );
                  } else if (state is ChartLoaded7D) {
                    return LineChartWidget(chartModel: state.chart);
                  } else if (state is ChartError7D) {
                    return Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.error.toString(),
                          style: $styles.text.bodyMedium,
                        ));
                  } else {
                    return const SizedBox();
                  }
                }),
                BlocBuilder<ChartBloc14D, ChartState14D>(builder: (context, state) {
                  if (state is ChartLoading14D) {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: $styles.colors.green),
                    );
                  } else if (state is ChartLoaded14D) {
                    return LineChartWidget(chartModel: state.chart);
                  } else if (state is ChartError14D) {
                    return Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.error.toString(),
                          style: $styles.text.bodyMedium,
                        ));
                  } else {
                    return const SizedBox();
                  }
                }),
                BlocBuilder<ChartBloc30D, ChartState30D>(builder: (context, state) {
                  if (state is ChartLoading30D) {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: $styles.colors.green),
                    );
                  } else if (state is ChartLoaded30D) {
                    return LineChartWidget(chartModel: state.chart);
                  } else if (state is ChartError30D) {
                    return Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.error.toString(),
                          style: $styles.text.bodyMedium,
                        ));
                  } else {
                    return const SizedBox();
                  }
                }),
              ]),
            ),
            TabBar(
                tabAlignment: TabAlignment.center,
                labelPadding: const EdgeInsets.only(left: 20),
                controller: _tabController,
                labelColor: $styles.colors.green,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: $styles.colors.green,
                labelStyle: $styles.text.labelLarge,
                dividerColor: $styles.colors.black,
                tabs: const [
                  Tab(
                    text: "1D",
                  ),
                  Tab(
                    text: "7D",
                  ),
                  Tab(
                    text: "14D",
                  ),
                  Tab(
                    text: "30D",
                  ),
                ]),
            SizedBox(
              height: $styles.insets.md,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'History',
                style: $styles.text.titleMedium
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: $styles.insets.sm,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xFF333333), width: 2)),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'High 24H',
                          style: $styles.text.labelLarge
                              .copyWith(color: Colors.grey),
                        ),
                        Text(
                          '\$${widget.coin.high24H}',
                          style: $styles.text.titleMedium
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'SOLD',
                              style: $styles.text.labelLarge
                                  .copyWith(color: $styles.colors.green),
                            ),
                          ),
                        ),
                        Text(
                          '23 JUN 2024',
                          style: $styles.text.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: $styles.insets.sm,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xFF333333), width: 2)),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Low 24H',
                          style: $styles.text.labelLarge
                              .copyWith(color: Colors.grey),
                        ),
                        Text(
                          '\$${widget.coin.low24H}',
                          style: $styles.text.titleMedium
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'BUY',
                              style: $styles.text.labelLarge
                                  .copyWith(color: $styles.colors.amber),
                            ),
                          ),
                        ),
                        Text(
                          '23 JUN 2024',
                          style: $styles.text.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: $styles.insets.sm,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 167,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: $styles.colors.green,
                      ),
                      child: Text(
                        'Buy',
                        style: $styles.text.labelLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 167,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: $styles.colors.amber,
                      ),
                      child: Text(
                        'Sell',
                        style: $styles.text.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

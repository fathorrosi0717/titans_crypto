import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/model/chart_model.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({
    super.key,
    required this.chartModel,
  });

  final ChartModel chartModel;

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    $styles.colors.green,
    Colors.cyan,
  ];

  bool showAvg = false;

  List<FlSpot> _generateData(List<List<double>> data) {
    final List<FlSpot> spots = [];
    for (final List<double> entry in data) {
      spots.add(FlSpot(entry[0], entry[1]));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        gridData: const FlGridData(
          show: false,
        ),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(border: Border.all(color: Colors.transparent)),
        lineBarsData: [
          LineChartBarData(
              spots: _generateData(widget.chartModel.prices),
              isCurved: true,
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  )))
        ]));
  }
}

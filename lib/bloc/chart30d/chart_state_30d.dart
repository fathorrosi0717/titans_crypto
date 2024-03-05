part of 'chart_bloc_30d.dart';

sealed class ChartState30D extends Equatable {}

class ChartInitial30D extends ChartState30D {
  @override
  List<Object?> get props => [];
}

class ChartLoading30D extends ChartState30D {
  @override
  List<Object?> get props => [];
}

class ChartLoaded30D extends ChartState30D {
  final ChartModel chart;

  ChartLoaded30D({required this.chart});

  @override
  List<Object?> get props => [chart];
}

class ChartError30D extends ChartState30D {
  final NetworkExceptions error;

  ChartError30D({required this.error});

  @override
  List<Object?> get props => [error];
}

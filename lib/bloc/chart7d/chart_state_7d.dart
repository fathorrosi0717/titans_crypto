part of 'chart_bloc_7d.dart';

sealed class ChartState7D extends Equatable {}

class ChartInitial7D extends ChartState7D {
  @override
  List<Object?> get props => [];
}

class ChartLoading7D extends ChartState7D {
  @override
  List<Object?> get props => [];
}

class ChartLoaded7D extends ChartState7D {
  final ChartModel chart;

  ChartLoaded7D({required this.chart});

  @override
  List<Object?> get props => [chart];
}

class ChartError7D extends ChartState7D {
  final NetworkExceptions error;

  ChartError7D({required this.error});

  @override
  List<Object?> get props => [error];
}

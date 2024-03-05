part of 'chart_bloc_14d.dart';

sealed class ChartState14D extends Equatable {}

class ChartInitial14D extends ChartState14D {
  @override
  List<Object?> get props => [];
}

class ChartLoading14D extends ChartState14D {
  @override
  List<Object?> get props => [];
}

class ChartLoaded14D extends ChartState14D {
  final ChartModel chart;

  ChartLoaded14D({required this.chart});

  @override
  List<Object?> get props => [chart];
}

class ChartError14D extends ChartState14D {
  final NetworkExceptions error;

  ChartError14D({required this.error});

  @override
  List<Object?> get props => [error];
}

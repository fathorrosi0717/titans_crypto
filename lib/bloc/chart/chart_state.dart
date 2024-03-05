part of 'chart_bloc.dart';

sealed class ChartState extends Equatable {}

class ChartInitial extends ChartState {
  @override
  List<Object?> get props => [];
}

class ChartLoading extends ChartState {
  @override
  List<Object?> get props => [];
}

class ChartLoaded extends ChartState {
  final ChartModel chart;

  ChartLoaded({required this.chart});

  @override
  List<Object?> get props => [chart];
}

class ChartError extends ChartState {
  final NetworkExceptions error;

  ChartError({required this.error});

  @override
  List<Object?> get props => [error];
}

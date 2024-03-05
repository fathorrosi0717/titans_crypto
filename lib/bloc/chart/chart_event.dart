part of 'chart_bloc.dart';

sealed class ChartEvent extends Equatable {}

class GetChart extends ChartEvent {
  final String id;
  final String days;

  GetChart({required this.id, required this.days});

  @override
  List<Object?> get props => [id, days];
}

part of 'chart_bloc_14d.dart';

sealed class ChartEvent14D extends Equatable {}

class GetChart14D extends ChartEvent14D {
  final String id;
  final String days;

  GetChart14D({required this.id, required this.days});

  @override
  List<Object?> get props => [id, days];
}

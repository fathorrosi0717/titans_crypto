part of 'chart_bloc_7d.dart';

sealed class ChartEvent7D extends Equatable {}

class GetChart7D extends ChartEvent7D {
  final String id;
  final String days;

  GetChart7D({required this.id, required this.days});

  @override
  List<Object?> get props => [id, days];
}

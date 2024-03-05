part of 'chart_bloc_30d.dart';

sealed class ChartEvent30D extends Equatable {}

class GetChart30D extends ChartEvent30D {
  final String id;
  final String days;

  GetChart30D({required this.id, required this.days});

  @override
  List<Object?> get props => [id, days];
}

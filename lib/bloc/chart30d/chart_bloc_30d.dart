import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/model/chart_model.dart';

part 'chart_event_30d.dart';
part 'chart_state_30d.dart';

class ChartBloc30D extends Bloc<ChartEvent30D, ChartState30D> {
  final Repository repository;

  ChartBloc30D({required this.repository}) : super(ChartInitial30D()) {
    on<GetChart30D>(_fetchChart);
  }

  Future<void> _fetchChart(GetChart30D event, Emitter<ChartState30D> emit) async {
    emit(ChartLoading30D());
    final result = await repository.getChart(event.id, event.days);

    result.fold((error) => emit(ChartError30D(error: error)),
        (data) => emit(ChartLoaded30D(chart: data)));
  }
}

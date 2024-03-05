import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/model/chart_model.dart';

part 'chart_event_14d.dart';
part 'chart_state_14d.dart';

class ChartBloc14D extends Bloc<ChartEvent14D, ChartState14D> {
  final Repository repository;

  ChartBloc14D({required this.repository}) : super(ChartInitial14D()) {
    on<GetChart14D>(_fetchChart);
  }

  Future<void> _fetchChart(GetChart14D event, Emitter<ChartState14D> emit) async {
    emit(ChartLoading14D());
    final result = await repository.getChart(event.id, event.days);

    result.fold((error) => emit(ChartError14D(error: error)),
        (data) => emit(ChartLoaded14D(chart: data)));
  }
}

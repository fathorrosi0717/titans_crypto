import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/model/chart_model.dart';

part 'chart_event_7d.dart';
part 'chart_state_7d.dart';

class ChartBloc7D extends Bloc<ChartEvent7D, ChartState7D> {
  final Repository repository;

  ChartBloc7D({required this.repository}) : super(ChartInitial7D()) {
    on<GetChart7D>(_fetchChart);
  }

  Future<void> _fetchChart(GetChart7D event, Emitter<ChartState7D> emit) async {
    emit(ChartLoading7D());
    final result = await repository.getChart(event.id, event.days);

    result.fold((error) => emit(ChartError7D(error: error)),
        (data) => emit(ChartLoaded7D(chart: data)));
  }
}

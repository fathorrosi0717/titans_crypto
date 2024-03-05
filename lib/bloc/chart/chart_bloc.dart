import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/model/chart_model.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final Repository repository;

  ChartBloc({required this.repository}) : super(ChartInitial()) {
    on<GetChart>(_fetchChart);
  }

  Future<void> _fetchChart(GetChart event, Emitter<ChartState> emit) async {
    emit(ChartLoading());
    final result = await repository.getChart(event.id, event.days);

    result.fold((error) => emit(ChartError(error: error)),
        (data) => emit(ChartLoaded(chart: data)));
  }
}

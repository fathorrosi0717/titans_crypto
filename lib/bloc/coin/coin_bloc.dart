import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:titans_crypto/logic/common/network_exceptions.dart';
import 'package:titans_crypto/logic/repository/repository.dart';
import 'package:titans_crypto/model/coin_model.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final Repository repository;

  CoinsBloc({required this.repository}) : super(CoinsInitial()) {
    on<GetCoins>(_fetchCoins);
  }

  Future<void> _fetchCoins(GetCoins event, Emitter<CoinsState> emit) async {
    emit(CoinsLoading());
    final result = await repository.getCoins();

    result.fold((error) => emit(CoinsError(error: error)),
        (data) => emit(CoinsLoaded(coins: data)));
  }
}

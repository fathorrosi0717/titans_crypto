part of 'coin_bloc.dart';

sealed class CoinsState extends Equatable {}

class CoinsInitial extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoading extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoaded extends CoinsState {
  final List<CoinModel> coins;

  CoinsLoaded({required this.coins});

  @override
  List<Object?> get props => [coins];
}

class CoinsError extends CoinsState {
  final NetworkExceptions error;

  CoinsError({required this.error});

  @override
  List<Object?> get props => [error];
}

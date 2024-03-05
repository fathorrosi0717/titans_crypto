part of 'coin_bloc.dart';

sealed class CoinsEvent extends Equatable {}

class GetCoins extends CoinsEvent {
  @override
  List<Object> get props => [];
}

part of 'crypto_list_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable{}

class CryptoListInitial extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoCoinDetailsState{
  CryptoListLoaded({
    required this.coinsList
    });

  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingError extends CryptoCoinDetailsState{
  CryptoListLoadingError({this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
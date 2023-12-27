import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:tutorial_app/repositories/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoCoinDetailsState>{
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit)async{
      try {
        if(state is! CryptoListLoaded){
        emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
        } catch (e) {
          emit(CryptoListLoadingError(exception: e));
      }
      finally{
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
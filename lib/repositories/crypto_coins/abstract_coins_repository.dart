import 'package:tutorial_app/repositories/models/crypto_coin.dart';

abstract class AbstractCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList();
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tutorial_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:tutorial_app/theme/crypto_coins_list_app.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>
  (() => CryptoCoinsRepository(dio: Dio()));
  runApp(const MyApp());
}
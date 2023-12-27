import 'package:tutorial_app/features/crypto_list/view/crypto_list_screen.dart';
import '../features/crypto_coin/view/crypto_coin_screen.dart';

final routes = {
        '/' : (context) => const CryptoListScreen(title: 'crpyto app :(' ),
        '/coin': (context) => const CryptoCoinScreen()
      };
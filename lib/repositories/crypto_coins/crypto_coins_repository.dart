import 'package:dio/dio.dart';
import 'package:tutorial_app/repositories/crypto_coins/crypto_coins.dart';


class CryptoCoinsRepository implements AbstractCoinsRepository{
  CryptoCoinsRepository({
    required this.dio
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async{
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,XRP&tsyms=USD'
      );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries
    .map((e) {
      final usdData = (e.value as Map<String,dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
      name: e.key,
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
      }
      ).toList();
      return cryptoCoinList;



  }
  // @override
  // Future<CryptoCoinDetail> getCoinDetails(String currencyCode) async{
  //   final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

  //   final data = response.data as Map<String, dynamic>;
  //   final dataRaw = data['RAW'] as Map<String, dynamic>;
  //   final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
  //   final usdData = coinData['USD'] as Map<String, dynamic>;
  //   final price = usdData['PRICE'];
  //   final imageURL = usdData['IMAGEURL'];
  //   final toSymbol = usdData['TOSYMBOL'];
  //   final lastUpdate = usdData['LASTUPDATE'];
  //   final high24hour = usdData['HIGH24HOUR'];
  //   final low24hour = usdData['LOW24HOUR'];

  //   return CryptoCoinDetail(
  //     name: currencyCode,
  //     priceInUSD: price,
  //     imageURL: 'https://www.cryptocompare.com/$imageURL',
  //     toSymbol: toSymbol,
  //     lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
  //     high24hour: high24hour,
  //     low24hour: low24hour
  //   );
  }


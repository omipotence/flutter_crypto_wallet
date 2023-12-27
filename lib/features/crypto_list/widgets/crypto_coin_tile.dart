import 'package:flutter/material.dart';
import 'package:tutorial_app/repositories/models/crypto_coin.dart';

class  CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.theme,
    required this.coin,
  });

  final ThemeData theme;
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: Image.network(coin.imageUrl),
    title: Text(
    coin.name,
    style: theme.textTheme.bodyMedium,
    ),
    subtitle: Text('${coin.priceInUSD}\$',
    style: theme.textTheme.labelSmall, 
     ),
     trailing: const Icon(Icons.arrow_forward_ios),
     onTap: (){
      Navigator.of(context).pushNamed('/coin', 
      arguments: coin,
      );
     },
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tutorial_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:tutorial_app/features/crypto_list/widgets/widgets.dart';
import 'package:tutorial_app/repositories/crypto_coins/crypto_coins.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState(){
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('crpyto app :('),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoCoinDetailsState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if(state is CryptoListLoaded){
               return ListView.separated(
                padding: const EdgeInsets.only(top:16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, i){
                  return const Divider(
                    color:  Color.fromARGB(255, 57, 57, 57)
                  );
                  },
                itemBuilder: (context, i) {
                  final coin =  state.coinsList[i];
                  return CryptoCoinTile(theme: theme, coin: coin);
                }
            );
            }
            if(state is CryptoListLoadingError){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Something went wrong',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30)
                      ),
                    const Text(
                      'Please try again later',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
                    ),
                    const SizedBox(height: 30,),
                    TextButton(onPressed: (){_cryptoListBloc.add(LoadCryptoList());}, 
                    child: const 
                    Text('Try again', 
                    style: TextStyle(fontSize: 25)))
                  ],
                  )
                );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      );
  }
}


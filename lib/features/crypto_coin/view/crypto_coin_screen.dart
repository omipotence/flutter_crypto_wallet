import 'dart:developer';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget{
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if(args == null){
      log('put in args');
      return;
    }
    if(args is! String){
      log('string parced in args');
      return;
    }
    coinName = args;
    setState(() {
      
    });
    super.didChangeDependencies();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: (){
          Navigator.of(context).pushNamed('/');
        },
        ),
        centerTitle: true,
        title: Text(coinName ?? '---'),
        
      ),
    );
  }
}
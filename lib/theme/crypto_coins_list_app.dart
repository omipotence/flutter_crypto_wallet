import 'package:flutter/material.dart';

import '../router/router.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fgb',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routes: routes,
    );
  }
}
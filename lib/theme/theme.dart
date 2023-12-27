import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 28, 28),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 31, 28, 28),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            ),
            labelSmall: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300
            ),
        ), 
      );
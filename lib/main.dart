import 'package:ecomapp_project/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'ECCOM APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'sans',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black26,
          ),
          prefixIconColor: Colors.black26,
          contentPadding: EdgeInsets.only(left: 0),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20
          )
        )
      ),
      home: const HomePage(),
    );
  }
}
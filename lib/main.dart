import 'package:ecomapp_project/pages/cart_provider.dart';
import 'package:ecomapp_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
          chipTheme: const ChipThemeData(
            backgroundColor: Color.fromARGB(255, 227, 242, 253),
            shape: RoundedRectangleBorder(side:BorderSide(width: 0,color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(50))),
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            )
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color:  Colors.black,
            ),
            backgroundColor: Colors.white
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.white,
            elevation: 0,
            
          ),
          useMaterial3: true
        ),
        home: const  HomePage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Cart Page'
      ),
    );
  }
}
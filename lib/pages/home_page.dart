import 'dart:ffi';

import 'package:ecomapp_project/pages/global_products.dart';
import 'package:ecomapp_project/pages/product_card.dart';
import 'package:ecomapp_project/pages/shoe_filter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> filters = const [
    'ALL',
    'Addidas',
    'Nike',
    'Puma',
    'RedTape',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoee\nCollection',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    label: Text('Search'),
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black12),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 120,
              child: ShoeFilter(filteritem: filters), 
            ),
            Expanded(
              child:ListView.builder(
              
              itemCount: products.length, 
              itemBuilder:(context,index){
                final product =  products[index];
                return ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as double,
                  image: product['imageUrl'] as String
                );
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}

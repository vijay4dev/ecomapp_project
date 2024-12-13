import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoee\nCollection',
                    style: TextStyle(
                      fontSize: 30,
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
                        borderSide: BorderSide(width: 1.5,color: Colors.black12),                        
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(40),bottomLeft: Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),                        
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(40),bottomLeft: Radius.circular(40)),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecomapp_project/pages/cartpage.dart';
import 'package:ecomapp_project/pages/product_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentpage = 0;
  final List<Widget> _pages = [const ProductList(), const Cartpage()];

  void _onItemTapped(int index) {
    setState(() {
      _curentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _curentpage,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          rippleColor: Colors.amber[300] as Color,
          hoverColor: Colors.amber[100] as Color,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          gap: 10,
          activeColor: Colors.black,
          iconSize: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.amber[400] as Color,
          color: Colors.black,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
          ],
          onTabChange: _onItemTapped,
        ),
      ),
    );
  }
}

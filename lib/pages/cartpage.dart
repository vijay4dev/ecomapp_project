import 'package:ecomapp_project/pages/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart Page',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return Dismissible(
            key: Key(product['id'].toString()), // Ensure each item has a unique key
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              Provider.of<CartProvider>(context, listen: false).removeProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${product['title']} removed from cart',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: const StadiumBorder(),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            child: ListTile(
              leading: Image.asset(
                product['imageUrl'].toString(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                '${product['title']}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                'Size: ${product['selectedSize']} - \$${product['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
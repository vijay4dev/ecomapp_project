
import 'package:ecomapp_project/pages/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cartpage> {

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text('Cart Page',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final product = cart[index];
            return ListTile(
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
                '\$ ${product['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.dangerous),
                color: const Color.fromARGB(255, 200, 55, 45),
                onPressed: () {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product removed from cart',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),),
                          behavior: SnackBarBehavior.floating,
                          shape: StadiumBorder(),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                    );
                    Provider.of<CartProvider>(context, listen: false)
                        .removeProduct(product);
                  });
                },
              ),
            );
          },
        ));
  }
}

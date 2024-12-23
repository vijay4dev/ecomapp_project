import 'package:ecomapp_project/pages/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> Get_Product;

  const ProductDetailsPage({super.key, required this.Get_Product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selected = 0;

  void ontap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
    Provider.of<CartProvider>(context, listen: false).addProduct(widget.Get_Product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Details')),
      ),
      body: Column(
        children: [
          Text(
            widget.Get_Product['title'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.Get_Product['imageUrl'],
              height: 200,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(147, 227, 242, 253),
            ),
            child: Column(
              children: [
                Text(
                  '\$ ${widget.Get_Product['price']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (widget.Get_Product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = widget.Get_Product['sizes'][index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = size;
                              });
                            },
                            child: Chip(
                              backgroundColor:
                                  selected == size ? Colors.amber : null,
                              label: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Text('$size'),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add to cart
                      ontap();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black, // Icon color
                    ),
                    label: Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

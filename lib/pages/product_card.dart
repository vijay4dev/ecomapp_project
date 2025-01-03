import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price; 
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      margin: const EdgeInsets.all(20),
      child:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
            style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text('\$ $price',
            style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            Center(child: Image.asset(image,height: 200,width: 250))
          ],
        ),
      ),
    );
  }
}
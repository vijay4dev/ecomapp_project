
import 'package:ecomapp_project/pages/global_products.dart';
import 'package:ecomapp_project/pages/product_card.dart';
import 'package:ecomapp_project/pages/product_details_page.dart';
import 'package:ecomapp_project/pages/shoe_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  List<String> getCompanyNames() {
    final companies = products.map((product) => product['company'] as String).toSet().toList();
    companies.insert(0, 'ALL'); // Add 'ALL' filter at the beginning
    return companies;
  }

  @override
  Widget build(BuildContext context) {
  final filters = getCompanyNames();
  final FocusNode searchFocusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        // Unfocus the search bar when tapping outside
        searchFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Shoee\nCollection',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      focusNode: searchFocusNode,
                      decoration: const InputDecoration(
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ShoeFilter(filteritem: filters,focusNode: searchFocusNode,),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        // Unfocus the TextField when tapping on a product
                        searchFocusNode.unfocus();
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) {
                            return ProductDetailsPage(Get_Product: product);
                          }),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        backgroundColor: const Color.fromARGB(9, 0, 0, 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

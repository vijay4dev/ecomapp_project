import 'package:ecomapp_project/pages/global_products.dart';
import 'package:ecomapp_project/pages/product_card.dart';
import 'package:ecomapp_project/pages/product_details_page.dart';
import 'package:ecomapp_project/pages/shoe_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  List<Map<String, dynamic>> filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  String selectedFilter = 'ALL';

  void filterProducts() {
  final query = _searchController.text.toLowerCase();
  setState(() {
    filteredProducts = products.where((product) {
        final title = product['title'].toString().toLowerCase();
        final company = product['company'].toString().toLowerCase();
        final matchesQuery = title.contains(query);
        final matchesFilter = selectedFilter == 'ALL' || company == selectedFilter.toLowerCase();
        return matchesQuery && matchesFilter;
      }).toList();
      if (query.isNotEmpty) {
      selectedFilter = 'ALL';
      }
    });
}

void onFilterSelected(String filter) {
  setState(() {
    selectedFilter = filter;
    filterProducts();
  });
}

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
    _searchController.addListener(filterProducts);
  }
  
  List<String> getCompanyNames() {
    final companies = products
        .map((product) => product['company'] as String)
        .toList();
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
      child: SafeArea(
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
                         controller: _searchController,
                        focusNode: searchFocusNode,
                        decoration: const InputDecoration(
                          label: Text('Search'),
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.black12),
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
                  child: ShoeFilter(
                    filteritem: filters,
                    focusNode: searchFocusNode,
                    selectedFilter: selectedFilter,
                    onFilterSelected: onFilterSelected,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                    final product = filteredProducts[index];
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
    );
  }
}
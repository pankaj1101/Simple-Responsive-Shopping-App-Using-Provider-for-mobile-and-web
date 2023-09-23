import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/Pages/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(width: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 10),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (BuildContext context, int index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                        setState(() {});
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                        label: Text(filters[index]),
                        labelStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1080) {
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ProductDetailsPage(product: product);
                              },
                            ));
                          },
                          child: ProductCard(
                            price: product['price'] as double,
                            title: product['title'] as String,
                            imageUrl: product['imageUrl'] as String,
                            backGroundColor: index.isEven
                                ? Colors.blue.shade100
                                : const Color.fromRGBO(224, 224, 224, 1),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ProductDetailsPage(product: product);
                              },
                            ));
                          },
                          child: ProductCard(
                            price: product['price'] as double,
                            title: product['title'] as String,
                            imageUrl: product['imageUrl'] as String,
                            backGroundColor: index.isEven
                                ? Colors.blue.shade100
                                : const Color.fromRGBO(224, 224, 224, 1),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

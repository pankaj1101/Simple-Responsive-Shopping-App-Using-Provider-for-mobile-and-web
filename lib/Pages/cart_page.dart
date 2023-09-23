import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cart_provider.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  void onTapRemove(cartItem) {
    context.read<CartProvider>().removeProduct(cartItem);
    // Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        "Are You sure you want to remove product from your cart?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => onTapRemove(cartItem),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size : ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}

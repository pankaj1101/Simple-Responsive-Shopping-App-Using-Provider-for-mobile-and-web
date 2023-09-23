import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title, imageUrl;
  final double price;
  final Color backGroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl, required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Center(
            child: Image.asset(
              imageUrl,
              height: 175,
            ),
          ),
        ],
      ),
    );
  }
}

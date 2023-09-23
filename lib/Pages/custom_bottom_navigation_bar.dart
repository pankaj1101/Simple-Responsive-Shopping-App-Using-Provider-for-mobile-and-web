import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/cart_page.dart';
import 'package:shopping_app/Pages/homepage_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarStBar();
}

class _CustomBottomNavigationBarStBar extends State<CustomBottomNavigationBar> {
  List<Widget> pages = [
    const HomePage(),
    const CartPageScreen(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 35,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,size: 35,),
            label: '',
          ),
        ],
      ),
    );
  }
}

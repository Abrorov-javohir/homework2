import 'package:flutter/material.dart';
import 'package:uy_ishi/screens/plane_animation1.dart';
import 'package:uy_ishi/screens/shop_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlaneAnimation1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => onTabTapped(0),
              icon: const Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () => onTabTapped(1),
              icon: const Icon(Icons.shop),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Current index: $currentIndex'),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool ischanged = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        ischanged = !ischanged;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plane Animation"),
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://foodtank.com/wp-content/uploads/2021/09/gemma-stpjHJGqZyw-unsplash.jpg",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          secondChild: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXFaDvMhJfksW7Nedn_3o1z-oKxlVChAG7kS0gD35Cs1e7N0otMw7oGSgX4jqapSYpF4Q&usqp=CAU",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          crossFadeState:
              ischanged ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
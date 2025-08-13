import 'package:flutter/material.dart';
import 'package:shopping_app/screens/welcom_screen.dart';

void main() {
  runApp(ShopCraftApp());
}

class ShopCraftApp extends StatelessWidget {
  const ShopCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopCraft',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Suwannaphum-Regular',
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
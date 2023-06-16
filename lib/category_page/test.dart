import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/category_page/category.dart';

void main() => runApp(const testApp());

class testApp extends StatelessWidget {
  const testApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CategoryPage(),
    );
  }
}

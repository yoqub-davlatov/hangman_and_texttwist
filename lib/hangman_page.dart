import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HangmanPage extends StatelessWidget {
  const HangmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/my_background_image.png"),
    fit: BoxFit.cover,
    ),
    ),),
    );
  }
}

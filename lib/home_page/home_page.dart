import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/constants/constants.dart';
import '../category_page/category.dart';
import '../constants/games.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/my_background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 300,
                child: Text(
                  "PICK YOUR GAME AND LET THE FUN BEGIN!",
                  style: TextStyle(
                    fontFamily: Constants.fontFamily,
                    color: Colors.green,
                    fontSize: 35.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 150), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle:
                      const TextStyle(fontSize: 30, fontFamily: Constants.fontFamily),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
                child: const Text('Hangman'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoryPage(game: Games.hangman)),
                  );
                },
              ),
              const SizedBox(height: 40), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  textStyle:
                      const TextStyle(fontSize: 30, fontFamily: Constants.fontFamily),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
                child: const Text('TextTwist'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoryPage(game: Games.wordtwist)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

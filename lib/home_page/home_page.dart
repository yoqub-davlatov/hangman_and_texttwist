import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/category_page/category_hangman.dart';
import '../constants/constants.dart';
import '../category_page/category.dart';
import '../constants/games.dart';
import '../screen_size.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double Screenwidth = MediaQuery.of(context).size.width;
    double Screenheight = MediaQuery.of(context).size.height;
    print(Screenwidth);
    print(Screenheight);
    print(logicalWidth);
    print(logicalHeight);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.bckgrImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width:(logicalWidth / 400) * 300,
                child: const Text(
                  "PICK YOUR GAME AND LET THE FUN BEGIN!",
                  style: TextStyle(
                    fontFamily: Constants.fontFamily,
                    color: Colors.green,
                    fontSize: 35.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: (logicalHeight / 700) * 150), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                      fontSize: 30, fontFamily: Constants.fontFamily),
                  padding: EdgeInsets.symmetric(
                      horizontal: (logicalWidth / 400) * 110,
                      vertical: (logicalHeight / 700) * 20),
                ),
                child: const Text('Hangman'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HangManCategoryPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: (logicalHeight / 700) * 40), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 30, fontFamily: Constants.fontFamily),
                  padding: EdgeInsets.symmetric(
                      horizontal: (logicalWidth / 400) * 110,
                      vertical: (logicalHeight / 700) * 20),
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

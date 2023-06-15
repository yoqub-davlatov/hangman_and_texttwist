import 'package:flutter/material.dart';
import './UI/colors.dart';
import './UI/widget/figure_image.dart';
import './UI/widget/letter.dart';
import './utils/Game.dart';

class HangmanPage extends StatefulWidget {
  const HangmanPage({super.key});

  @override
  State<HangmanPage> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  String word = 'Flutter'.toUpperCase();
  final List<String> alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('').toList();

  bool isGameOver() {
    return Game.gameTries >= 6 || isWordGuessed();
  }

  void resetGame() {
    setState(() {
      word = 'Flutter'
          .toUpperCase(); // replace this line with your word generating logic if you want different words each time
      Game.selectedChar = [];
      Game.gameTries = 0;
    });
  }

  bool isWordGuessed() {
    for (var letter in word.split('')) {
      if (!Game.selectedChar.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text(
          "Hangman",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "KristenITC",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/my_background_image.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      figureImage(
                          Game.gameTries >= 0, "assets/images/hang_black.png"),
                      figureImage(
                          Game.gameTries >= 1, "assets/images/head_black.png"),
                      figureImage(
                          Game.gameTries >= 2, "assets/images/body_black.png"),
                      figureImage(
                          Game.gameTries >= 3, "assets/images/ra_black.png"),
                      figureImage(
                          Game.gameTries >= 4, "assets/images/la_black.png"),
                      figureImage(
                          Game.gameTries >= 5, "assets/images/rl_black.png"),
                      figureImage(
                          Game.gameTries >= 6, "assets/images/ll_black.png"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 3.0,
                    runSpacing: 3.0,
                    children: word
                        .split('')
                        .map((e) => letter(e.toUpperCase(),
                            !Game.selectedChar.contains(e.toUpperCase())))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: GridView.count(
                    crossAxisCount: 7,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    padding: const EdgeInsets.all(8.0),
                    children: alphabet.map((e) {
                      return RawMaterialButton(
                          onPressed:
                              isGameOver() || Game.selectedChar.contains(e)
                                  ? null
                                  : () {
                                      setState(() {
                                        Game.selectedChar.add(e);
                                        if (!word
                                            .split('')
                                            .contains(e.toUpperCase())) {
                                          Game.gameTries++;
                                        }
                                      });
                                    },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          fillColor: Game.selectedChar.contains(e)
                              ? word.split('').contains(e.toUpperCase())
                                  ? Colors.green
                                  : Colors.black
                              : Colors.blue,
                          child: Text(
                            e,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'KristenITC',
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          if (isGameOver())
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isWordGuessed() ? 'You Passed!' : 'You Lost!',
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: resetGame,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        isWordGuessed() ? 'Next Level' : 'Play Again',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }
}

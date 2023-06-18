import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import './UI/widget/figure_image.dart';
import './UI/widget/letter.dart';
import './utils/Game.dart';

class HangmanPage extends StatefulWidget {
  const HangmanPage({super.key});

  @override
  State<HangmanPage> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  Duration duration = const Duration(minutes: 1, seconds: 30);
  Timer? timer;
  String word = 'Codeforces'.toUpperCase();
  final List<String> alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('').toList();

  int points = 300;
  int coins = 50;
  int round = 1;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    void addSecond() {
      setState(() {
        final seconds = duration.inSeconds - 1;
        if (seconds < 0) {
          timer?.cancel();
          return;
        }
        duration = Duration(seconds: seconds);
      });
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addSecond());
  }

  bool isGameOver() {
    return Game.gameTries >= 6 || isWordGuessed() || duration.inSeconds == 0;
  }

  void resetGame() {
    if (isWordGuessed()) {
      round++;
      points += (6 - Game.gameTries) * 100;
      coins += 10;
    } else {
      round = 1;
    }
    duration = const Duration(minutes: 1, seconds: 30);
    startTimer();
    setState(() {
      word = 'Codeforces'
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

  Widget showTimerWidget() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      "$minutes:$seconds",
      style: const TextStyle(
        fontFamily: Constants.fontFamily,
        fontSize: 30,
      ),
    );
  }

  Widget messageBar() {
    timer?.cancel();
    return Container(
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
            const SizedBox(height: 30),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hangman",
          style: TextStyle(
            color: Colors.white,
            fontFamily: Constants.fontFamily,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Constants.bckgrImagePath,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 118,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            "$points",
                            style: const TextStyle(
                              fontFamily: Constants.fontFamily,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$round",
                            style: const TextStyle(
                              fontFamily: Constants.fontFamily,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 118,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$coins",
                            style: const TextStyle(
                              fontFamily: Constants.fontFamily,
                              fontSize: 24,
                            ),
                          ),
                          const Icon(
                            Icons.diamond,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.lightbulb,
                        color: Colors.yellow[600],
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        fixedSize: const Size(45, 45),
                      ),
                    ),
                    Container(
                      child: showTimerWidget(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.diamond,
                        color: Colors.redAccent[700],
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        fixedSize: const Size(45, 45),
                      ),
                    ),
                  ],
                ),
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
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 8,
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
                              fontSize: 28,
                              fontFamily: Constants.fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          if (isGameOver()) messageBar(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../category_page/category_hangman.dart';
import '../../../constants/constants.dart';

import '../../utils/Game.dart';

Widget failPassWidget(
    BuildContext context, bool pass, final resetGame, bool finish) {
  const double verticalRatio = 322.0 / 823.0;
  const double horizontalRatio = 335.0 / 421.0;
  double screenHeight = MediaQuery.of(context).size.height * verticalRatio;
  double screenWidth = MediaQuery.of(context).size.width * horizontalRatio;
  return Center(
    child: Container(
      margin: const EdgeInsets.only(bottom:80),
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pass
                          ? finish
                              ? 'That was awesome!\nYou won the game!'
                              : 'The man lives to see another day!\nyay :)'
                          : 'Word: ${Game.words[Game.guessed]}\nThe man dies\n:(',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontFamily: Constants.fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: finish || !pass
                          ? () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HangManCategoryPage(),
                                ),
                              );
                            }
                          : resetGame,
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(251, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(
                          color: Color(0xff3E87FF),
                          width: 3,
                        ),
                      ),
                      child: Text(
                        pass
                            ? finish
                                ? 'Return'
                                : 'Next Level'
                            : 'Return',
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: Constants.fontFamily,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              color: pass ? Colors.green : Colors.red,
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
            ),
            alignment: Alignment.center,
            width: 220,
            height: 40,
            child: Text(
              pass
                  ? finish
                      ? "Congratulations!"
                      : "Level Passed"
                  : "Level Failed",
              style: const TextStyle(
                fontFamily: Constants.fontFamily,
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

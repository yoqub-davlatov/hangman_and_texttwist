import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/constants/constants.dart';

import '../../utils/Game.dart';

Widget failPassWidget(BuildContext context, bool pass, final resetGame) {
  const double verticalRatio = 322.0 / 823.0;
  const double horizontalRatio = 335.0 / 421.0;
  double screenHeight = MediaQuery.of(context).size.height * verticalRatio;
  double screenWidth = MediaQuery.of(context).size.width * horizontalRatio;
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 150, 0, 0),
    child: SizedBox(
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
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pass
                          ? 'The man lives to see another day!\nyay :)'
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
                      onPressed: resetGame,
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
                        pass ? 'Next Level' : 'Play Again',
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
            width: 200,
            height: 40,
            child: Text(
              pass ? "Level Passed" : "Level Failed",
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

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../utils/Game.dart';

Widget keyboardWidget(final String word, bool isGameOver, final setStateFunction) {
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: GridView.count(
      crossAxisCount: 8,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: const EdgeInsets.all(8.0),
      children: Game.alphabet.map((e) {
        return RawMaterialButton(
            onPressed: isGameOver || Game.selectedChar.contains(e)
                ? null
                : setStateFunction(e),
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
  );
}

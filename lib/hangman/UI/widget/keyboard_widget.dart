import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../utils/Game.dart';

Widget keyboardWidget(final String word, bool isGameOver, final setStateFunction) {
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: GridView(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 2.0,
      ),
      children: [
        ...Game.alphabet.getRange(0, 10).map(
              (e) => buildRawMaterialButton(e, word, isGameOver, setStateFunction),
        ),
        const SizedBox(),
        ...Game.alphabet.getRange(10, 19).map(
              (e) => buildRawMaterialButton(e, word, isGameOver, setStateFunction),
        ),
        const SizedBox(),
        const SizedBox(),
        ...Game.alphabet.getRange(19, 26).map(
              (e) => buildRawMaterialButton(e, word, isGameOver, setStateFunction),
        ),
      ],
    ),
  );
}

RawMaterialButton buildRawMaterialButton(String e, String word, bool isGameOver, final setStateFunction) {
  return RawMaterialButton(
    onPressed: isGameOver || Game.selectedChar.contains(e)
        ? null
        : setStateFunction(e),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    fillColor: Game.selectedChar.contains(e)
        ? word.split('').contains(e.toUpperCase())
        ? Colors.red
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
    ),
  );
}

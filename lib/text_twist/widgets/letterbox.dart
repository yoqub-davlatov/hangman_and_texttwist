import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/text_twist/assets.dart';

Widget letter(LetterElem character, bool selected, Function callback) {
  return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(

        color: selected ? Colors.blue : Colors.transparent,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: RawMaterialButton (
            onPressed: () {
              int toDelete = WordsInfo.typedLetters.indexOf(character);
              WordsInfo.typedLetters[toDelete] = LetterElem("");
              WordsInfo.updateIndex();
              callback();
            },
            child: Text(
              character.letter,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'KristenITC',
                fontSize: 25.0,
              ),
        )
        ),
      ));
}

import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/text_twist/assets.dart';

class TwistKeyboard extends StatefulWidget {
  const TwistKeyboard({super.key});

  @override
  State<TwistKeyboard> createState() => _TwistKeyboardState();
}

class _TwistKeyboardState extends State<TwistKeyboard> {
  @override
  Widget build(BuildContext context) {
    WordsInfo.letters.shuffle();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: WordsInfo.letters.map((e) {
            return InkWell(
                onTap: () {
                  setState(() {
                    WordsInfo.typedLetters.add(e);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 3, color: Colors.blue),
                    color: Colors.blue,
                  ),
                  child: Text(
                    "$e",
                    style: const TextStyle(color: Colors.white),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }
}

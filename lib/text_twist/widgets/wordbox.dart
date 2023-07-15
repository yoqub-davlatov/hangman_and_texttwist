import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/text_twist/assets.dart';

bool isGiveUp2 = false;
bool isWon = false;

class WordBox extends StatefulWidget {
  String inputWord = "";
  List words = [];
  Function setWin;

  WordBox(
      {super.key,
      required this.inputWord,
      required this.words,
      required this.setWin});

  @override
  State<WordBox> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  // List<String> words = ["cat", "pen", "ate", "dog", "bat", "rat", "pan", "penca"];
  Set<String> guessed = WordsInfo.guessed;

  void _setWin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.setWin();
    });
  }

  @override
  Widget build(BuildContext context) {
    String inputWord = widget.inputWord;
    List<String> words = widget.words.map((e) => e.toString()).toList();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 15,
            runSpacing: 15,
            children: words
                .map(
                  (word) => Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: word
                        .split('')
                        .map(
                          (letter) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 2, color: Colors.blue),
                              color: isGuessed(inputWord, word)
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                            height: 30,
                            width: 25,
                            child: Visibility(
                              visible: isGuessed(inputWord, word),
                              child: Center(
                                child: Text(
                                  letter,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KristenITC',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  void guessedAll() {
    if (guessed.length == widget.words.length) {
      _setWin();
    }
  }

  bool isGuessed(String inputWord, String currentWord) {
    if (guessed.contains(currentWord) ||
        inputWord == currentWord ||
        isGiveUp2) {
      if (inputWord == currentWord) {
        guessed.add(inputWord);
        guessedAll();
      }
      return true;
    }
    return false;
  }
}

import 'package:flutter/material.dart';
class WordBox extends StatefulWidget {
  String inputWord = "";
  List words = [];

  WordBox({super.key, required this.inputWord, required this.words});

  @override
  State<WordBox> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  // List<String> words = ["cat", "pen", "ate", "dog", "bat", "rat", "pan", "penca"];
  Set<String> guessed = {};

  @override
  Widget build(BuildContext context) {
    print(guessed);
    String inputWord = widget.inputWord;
    List<String> words = widget.words.map((e) => e.toString()).toList();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 20,
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

  bool isGuessed(String inputWord, String currentWord) {
    if (guessed.contains(currentWord) || inputWord == currentWord) {
      guessed.add(inputWord);
      return true;

    }
    return false;
  }
}

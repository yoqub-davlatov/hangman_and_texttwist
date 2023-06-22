import 'package:flutter/material.dart';
import '../text_twist_page.dart';

class WordBox extends StatefulWidget {
  final String inputWord;

  const WordBox({super.key, required this.inputWord});

  @override
  State<WordBox> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  List<String> words = ["cat", "pen", "ate", "dog", "bat", "rat", "pen", "penca"];

  @override
  Widget build(BuildContext context) {
    String word2 = widget.inputWord;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.8,
          child:
            Wrap(
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
                                color:  word2 == word ? Colors.green : Colors.transparent,
                              ),
                              height: 30,
                              width: 25,
                              padding: const EdgeInsets.all(5),
                              child: Visibility(
                                visible: word2 == word,
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
}

import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/text_twist/widgets/letterbox.dart';
import 'package:hangman_and_texttwist/text_twist/assets.dart';

class TextTwist extends StatefulWidget {
  const TextTwist({super.key});

  @override
  State<TextTwist> createState() => _TextTwistState();
}

class _TextTwistState extends State<TextTwist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TextTwist",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "KristenITC",
            fontSize: 30,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 500,
            width: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: WordsInfo.typedLetters.map((e) {
              return Container(
                  padding: const EdgeInsets.all(2.0),
                  child: letter(e, e != ''));
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: WordsInfo.letters.map((e) {
              return RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (!WordsInfo.typedLetters.contains(e)) {
                        WordsInfo.typedLetters[WordsInfo.index] = e;
                        WordsInfo.index++;
                      }
                    });
                  },
                  fillColor: WordsInfo.typedLetters.contains(e)
                      ? Colors.white
                      : Colors.blue,
                  constraints: BoxConstraints.tight(const Size(40, 40)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'KristenITC',
                      fontWeight: FontWeight.bold,
                    ),
                  ));
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              RawMaterialButton(
                fillColor: Colors.red.shade800,
                onPressed: () {
                  setState(() {
                    WordsInfo.typedLetters =
                        WordsInfo.typedLetters.map((_) => '').toList();
                    WordsInfo.index = 0;
                  });
                },
                constraints: BoxConstraints.tight(const Size(100, 45)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'KristenITC',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.green.shade800,
                constraints: BoxConstraints.tight(const Size(100, 45)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'KristenITC',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

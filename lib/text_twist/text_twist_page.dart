
import 'package:flutter/material.dart';
import 'widgets/letterbox.dart';
import 'assets.dart';
import '../constants/constants.dart';
import "widgets/stopwatch.dart";
import 'widgets/wordbox.dart';

class TextTwist extends StatefulWidget {
  const TextTwist({super.key});

  @override
  State<TextTwist> createState() => _TextTwistState();
}

class _TextTwistState extends State<TextTwist> {
  String input = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Constants.bckgrImagePath,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            const StopWatch(),  // Timer widget, think about stopping it when the word is guessed
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: height * 0.45,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: WordBox(
                    inputWord: input,
                    words: WordsInfo.words,
                  ),
                ),
              ],
            ),
            // WordBox widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: WordsInfo.typedLetters.map((e) {
                return Container(
                    padding: const EdgeInsets.all(2.0),
                    child: letter(e, e != ''));
              }).toList(),
            ),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
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
              ],
            ),
            RawMaterialButton(
              onPressed: () {
                print(WordsInfo.words);
                print(WordsInfo.letters);
                setState(() {
                  input = WordsInfo.getWord();
                });
              },
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
              )
            ),
              ],
            )
      ),
        );
      // ),
    // );
  }
}

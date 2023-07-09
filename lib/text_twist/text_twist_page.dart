import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/text_twist/widgets/restart_widget.dart';
import '../hangman/UI/widget/TimerWidget.dart';
import '../hangman/UI/widget/TimerWidget.dart';
import '../hangman/UI/widget/hint_widget.dart';
import '../hangman/UI/widget/level_widget.dart';
import '../hangman/UI/widget/points_widget.dart';
import '../hangman/UI/widget/show_hint_widget.dart';
import '../services/api_service.dart';
import 'widgets/Game.dart';
import 'widgets/letterbox.dart';
import 'assets.dart';
import '../constants/constants.dart';
import 'widgets/player.dart';
import "widgets/stopwatch.dart";
import 'widgets/wordbox.dart';
import 'widgets/showGiveUpWidget.dart';

class TextTwist extends StatefulWidget {
  final String category;
  static final GlobalKey<_TextTwistState> textTwistKey =
      GlobalKey<_TextTwistState>();

  const TextTwist({super.key, required this.category});

  @override
  State<TextTwist> createState() => _TextTwistState();
}

class _TextTwistState extends State<TextTwist> {
  callbackDeleteLetter() {
    setState(() {});
  }

  bool isGiveUp1 = false;
  GlobalKey<TimerWidgetState> timerKey = GlobalKey();
  bool showRestart = false;

  Player player = Player();
  String input = "";

  @override
  void dispose() {
    timerKey.currentState?.dispose();
    isGiveUp2 = false;
    isWon = false;
    super.dispose();
  }

  giveup() async {
    setState(() {
      isGiveUp1 = true;
    });
  }

  void setGiveUpFalse() {
    setState(() {
      isGiveUp1 = false;
    });
  }

  void setGiveUpTrue() {
    setState(() {
      isGiveUp1 = false;
      isGiveUp2 = true;
    });
  }

  void stopTime() {
    if (isGiveUp2 || isWon) {
      timerKey.currentState?.stopTimer();
    }
  }

  bool gameEnded() {
    return isGiveUp2 || showRestart;
  }

  void setWon() {
    setState(() {
      isWon = true;
      showRestart = true;
    });
  }

  bool wonOrLost() {
    return !isGiveUp2;
  }

  Widget showRestartWidget() {
    stopTime();
    setState(() {});
    return Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 4.3,
      child: RestartWidget(
        context,
        wonOrLost(),
        gameEnded(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: const Text(
                "TextTwist",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "KristenITC",
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                giveup();
              },
              child: Text("""Give\n  up""",
                  style: TextStyle(
                    color: isGiveUp2 ? Colors.blue : Colors.white,
                    fontFamily: "KristenITC",
                    fontSize: 15,
                  )),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: isGiveUp2,
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      pointsWidget(player.points),
                      levelWidget(player.level),
                      diamondWidget(player.coins),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            // hintPressed = false;
                            // isFetching = true;
                            // showHint = true;
                          });
                          // await getHint();
                        },
                        icon: Icon(
                          Icons.lightbulb,
                          color: Colors.yellow[600],
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          fixedSize: const Size(45, 45),
                        ),
                      ),
                      TimerWidget(key: timerKey),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.diamond,
                          color: Colors.redAccent[700],
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          fixedSize: const Size(45, 45),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.9,
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
                          setWin: setWon,
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
                          child:
                              letter(e, e.letter != '', callbackDeleteLetter));
                    }).toList(),
                  ),
                  Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: WordsInfo.letters.map((e) {
                      return RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              if (WordsInfo.index !=
                                  WordsInfo.typedLetters.length) {
                                if (!WordsInfo.typedLetters.contains(e)) {
                                  WordsInfo.typedLetters[WordsInfo.index] = e;
                                  WordsInfo.updateIndex();
                                }
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
                            e.letter,
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
                    // direction: Axis.horizontal,
                    children: [
                      RawMaterialButton(
                        fillColor: Colors.red.shade800,
                        onPressed: () {
                          setState(() {
                            WordsInfo.typedLetters = WordsInfo.typedLetters
                                .map((e) => LetterElem(""))
                                .toList();
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
                        fillColor: Colors.blueGrey,
                        constraints: BoxConstraints.tight(const Size(45, 45)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            WordsInfo.shuffleKeyBoard();
                          });
                        },
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          print(WordsInfo.words);
                          print(
                              WordsInfo.letters.map((e) => e.letter).toList());
                          setState(() {
                            input = WordsInfo.getWord();
                            WordsInfo.typedLetters = WordsInfo.typedLetters
                                .map((e) => LetterElem(""))
                                .toList();
                            WordsInfo.index = 0;
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          showRestartWidget(),
          showGiveUpWidget(
            isGiveUp1,
            setGiveUpFalse,
            setGiveUpTrue,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../hangman/UI/widget/fail_pass_widget.dart';
import '../hangman/utils/player.dart';
import '../hangman/UI/widget/TimerWidget.dart';
import '../hangman/UI/widget/hint_widget.dart';
import '../hangman/UI/widget/level_widget.dart';
import '../hangman/UI/widget/show_hint_widget.dart';
import '../constants/constants.dart';
import 'UI/widget/figure_image.dart';
import 'UI/widget/letter.dart';
import 'utils/Game.dart';
import 'UI/widget/points_widget.dart';

class HangmanPage extends StatefulWidget {
  const HangmanPage({super.key});

  @override
  State<HangmanPage> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  bool hintPressed = false;
  GlobalKey<TimerWidgetState> timerKey = GlobalKey();
  int currHints = 0;

  Player player = Player();

  @override
  void dispose() {
    timerKey.currentState?.dispose();
    super.dispose();
  }

  bool showDescription = true;
  void setDescriptionFalse() {
    setState(() {
      showDescription = false;
      hintPressed = true;
    });
  }

  bool showHint = false;
  void setShowHintFalse() {
    setState(() {
      showHint = false;
      currHints++;
    });
  }

  bool isGameOver() {
    return Game.gameTries >= 6 || isWordGuessed();
  }

  void resetGame() {
    if (isWordGuessed()) {
      player.points += (6 - Game.gameTries) * 100;
      player.coins++;
      if (Game.guessed + 1 < Game.words.length) {
        player.level++;
        Game.guessed++;
      }
    } else {
      player.level = 1;
    }
    setState(() {
      currHints = 0;
      hintPressed = false;
      Game.selectedChar = [];
      Game.gameTries = 0;
      showDescription = true;
      timerKey.currentState?.restartTimer();
    });
  }

  bool isWordGuessed() {
    for (var letter in Game.words[Game.guessed].toUpperCase().split('')) {
      if (letter != ' ' && !Game.selectedChar.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  Widget levelEnds() {
    timerKey.currentState?.stopTimer();
    return failPassWidget(context, isWordGuessed(), resetGame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Game.categories[Game.guessed],
          style: const TextStyle(
            color: Colors.white,
            fontFamily: Constants.fontFamily,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: !hintPressed,
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
                        onPressed: () {
                          if (currHints < 3) {
                            setState(() {
                              showHint = true;
                            });
                          }
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
                      TimerWidget(
                        key: timerKey,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showDescription = true;
                            hintPressed = false;
                          });
                        },
                        icon: const Icon(
                          Icons.question_mark,
                          color: Colors.red,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          fixedSize: const Size(45, 45),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Stack(
                      children: [
                        figureImage(Game.gameTries >= 0,
                            "assets/images/hang_black.png"),
                        figureImage(Game.gameTries >= 1,
                            "assets/images/head_black.png"),
                        figureImage(Game.gameTries >= 2,
                            "assets/images/body_black.png"),
                        figureImage(
                            Game.gameTries >= 3, "assets/images/ra_black.png"),
                        figureImage(
                            Game.gameTries >= 4, "assets/images/la_black.png"),
                        figureImage(
                            Game.gameTries >= 5, "assets/images/rl_black.png"),
                        figureImage(
                            Game.gameTries >= 6, "assets/images/ll_black.png"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 3.0,
                      runSpacing: 3.0,
                      children: Game.words[Game.guessed]
                          .toUpperCase()
                          .split('')
                          .map(
                            (e) => letter(
                              e,
                              !Game.selectedChar.contains(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: GridView.count(
                      crossAxisCount: 8,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      padding: const EdgeInsets.all(8.0),
                      children: Game.alphabet.map((e) {
                        return RawMaterialButton(
                            onPressed:
                                isGameOver() || Game.selectedChar.contains(e)
                                    ? null
                                    : () {
                                        setState(() {
                                          Game.selectedChar.add(e);
                                          if (!Game.words[Game.guessed]
                                              .toUpperCase()
                                              .split('')
                                              .contains(e)) {
                                            Game.gameTries++;
                                          }
                                        });
                                      },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            fillColor: Game.selectedChar.contains(e)
                                ? Game.words[Game.guessed]
                                        .toUpperCase()
                                        .split('')
                                        .contains(e)
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
                  )
                ],
              ),
            ),
          ),
          if (isGameOver()) levelEnds(),
          showHintWidget(showDescription, Game.descriptions[Game.guessed],
              setDescriptionFalse),
          showHintWidget(
            showHint,
            Game.hints[Game.guessed][currHints % 3],
            setShowHintFalse,
          ),
        ],
      ),
    );
  }
}

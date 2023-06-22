import 'package:flutter/material.dart';
import 'package:hangman_and_texttwist/hangman/UI/widget/fail_pass_widget.dart';
import '../hangman/utils/player.dart';
import '../hangman/UI/widget/TimerWidget.dart';
import '../hangman/UI/widget/hint_widget.dart';
import '../hangman/UI/widget/level_widget.dart';
import '../hangman/UI/widget/show_hint_widget.dart';
import '../services/api_service.dart';
import '../constants/constants.dart';
import 'UI/widget/figure_image.dart';
import 'UI/widget/letter.dart';
import 'utils/Game.dart';
import 'UI/widget/points_widget.dart';

class HangmanPage extends StatefulWidget {
  final String category;
  const HangmanPage({super.key, required this.category});

  @override
  State<HangmanPage> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  GlobalKey<TimerWidgetState> timerKey = GlobalKey();
  late String prompt = Game.getPrompt(widget.category);

  Player player = Player();

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  bool showHint = true;
  void setHintFalse() {
    setState(() {
      showHint = false;
    });
  }

  void getMessage() async {
    // final contentResponse = await APIService.getMessage(Game.message);
    final contentResponse = await hangmanApiCall(prompt);
    setState(() {
      showHint = true;
      Game.word = contentResponse['word'].toString().toUpperCase();
      Game.hint = contentResponse['hint'];
    });
  }

  bool isGameOver() {
    return Game.gameTries >= 6 || isWordGuessed();
  }

  void resetGame() {
    if (isWordGuessed()) {
      player.level++;
      player.points += (6 - Game.gameTries) * 100;
      player.coins++;
    } else {
      player.level = 1;
    }
    setState(() {
      getMessage();
      Game.selectedChar = [];
      Game.gameTries = 0;
      timerKey.currentState?.restartTimer();
    });
  }

  bool isWordGuessed() {
    for (var letter in Game.word.split('')) {
      if (!Game.selectedChar.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hangman",
          style: TextStyle(
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
          Container(
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
                      onPressed: () {},
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
                Center(
                  child: Stack(
                    children: [
                      figureImage(
                          Game.gameTries >= 0, "assets/images/hang_black.png"),
                      figureImage(
                          Game.gameTries >= 1, "assets/images/head_black.png"),
                      figureImage(
                          Game.gameTries >= 2, "assets/images/body_black.png"),
                      figureImage(
                          Game.gameTries >= 3, "assets/images/ra_black.png"),
                      figureImage(
                          Game.gameTries >= 4, "assets/images/la_black.png"),
                      figureImage(
                          Game.gameTries >= 5, "assets/images/rl_black.png"),
                      figureImage(
                          Game.gameTries >= 6, "assets/images/ll_black.png"),
                      showHintWidget(showHint, Game.hint, setHintFalse),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 3.0,
                    runSpacing: 3.0,
                    children: Game.word
                        .split('')
                        .map((e) => letter(e.toUpperCase(),
                            !Game.selectedChar.contains(e.toUpperCase())))
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
                                        if (!Game.word
                                            .split('')
                                            .contains(e.toUpperCase())) {
                                          Game.gameTries++;
                                        }
                                      });
                                    },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          fillColor: Game.selectedChar.contains(e)
                              ? Game.word.split('').contains(e.toUpperCase())
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
          if (isGameOver()) failPassWidget(context, isWordGuessed(), resetGame),
        ],
      ),
    );
  }
}

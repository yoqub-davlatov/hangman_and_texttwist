import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../text_twist/text_twist_page.dart';
import '../category_page/category_button.dart';
import '../constants/games.dart';
import '../hangman/hangman_page.dart';

class CategoryPage extends StatefulWidget {
  final Games game;
  const CategoryPage({Key? key, required this.game}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/my_background_image.png',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.blue,
                        width: 10,
                      ),
                    ),
                    height: 600,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        categoryButton("Food"),
                        categoryButton("Anime"),
                        categoryButton("Drinks"),
                        categoryButton("Astronomy"),
                        categoryButton("History"),
                        const Text(
                          "Wanna use your own category?\nno problem",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Constants.fontFamily,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: "Enter your category",
                              hintStyle: const TextStyle(
                                fontFamily: Constants.fontFamily,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.game == Games.hangman
                                ? const HangmanPage()
                                : const TextTwist()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: Constants.fontFamily,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                width: 200,
                height: 50,
                child: const Text(
                  "Category",
                  style: TextStyle(
                    fontFamily: Constants.fontFamily,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                    height: 65,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xff3E87FF),
                        width: 10,
                      ),
                    ),
                    height: screenHeight * 0.8,
                    width: screenWidth * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        categoryButton("Food"),
                        categoryButton("Anime"),
                        categoryButton("Drinks"),
                        categoryButton("Astronomy"),
                        categoryButton("History"),
                        const Text(
                          "Wanna use your own category?\nNo problem",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.fontFamily,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.06,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: Constants.fontFamily,
                              color: Color(0xff42B462),
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xff3E87FF),
                                  width: 3.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xff3E87FF),
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xff3E87FF),
                                  width: 3.0,
                                ),
                              ),
                              hintText: "Enter your category",
                              hintStyle: const TextStyle(
                                fontSize: 22,
                                fontFamily: Constants.fontFamily,
                                color: Color.fromRGBO(66, 180, 98, 0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      backgroundColor: const Color(0xffFFFB00),
                      fixedSize: Size(screenWidth * 0.7, screenHeight * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(
                        color: Color(0xff3E87FF),
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: Constants.fontFamily,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: screenHeight * 0.04,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Color(0xff3E87FF),
                  ),
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.07,
                  child: const Text(
                    "Category",
                    style: TextStyle(
                      fontFamily: Constants.fontFamily,
                      color: Colors.white,
                      fontSize: 26,
                    ),
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../hangman/hangman_page.dart';
import '../constants/constants.dart';
import '../hangman/utils/Game.dart';
import '../services/api_service.dart';

class HangManCategoryPage extends StatefulWidget {
  const HangManCategoryPage({super.key});

  @override
  State<HangManCategoryPage> createState() => _HangManCategoryPageState();
}

class _HangManCategoryPageState extends State<HangManCategoryPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  bool error = false;

  int cnt = 1;
  TextEditingController inputController = TextEditingController();
  final List<String> categoryList = [
    'FOOD',
    'SPORT',
    'ANIME',
    'MOVIES',
    'MUSIC',
    'ASTRONOMY',
    'SCIENCE',
    'HISTORY',
  ];
  bool isLoading = false;
  bool readyToStart = false;
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STORY MODE',
          style: TextStyle(
            fontFamily: Constants.fontFamily,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/my_background_image.png',
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.fill,
          ),
          Visibility(
            visible: !readyToStart,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xff3E87FF),
                          width: 4,
                        ),
                      ),
                      height: screenHeight * 0.8,
                      width: screenWidth * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: List<Widget>.from(
                                  categoryList.map(
                                    (name) => categoryButton(
                                      name,
                                      categories.contains(name),
                                      screenHeight,
                                      screenWidth,
                                    ),
                                  ),
                                ) +
                                [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Wanna use your own category?\nNo problem",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: Constants.fontFamily,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  textFieldWidget(screenWidth),
                                ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: categories
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      categories.remove(e);
                                    });
                                  },
                                  child: Chip(
                                    backgroundColor: Colors.blue,
                                    shape: const StadiumBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    label: Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: Constants.fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Select number of\nwords per category",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: Constants.fontFamily,
                        ),
                      ),
                    ),
                    incrementButton(),
                    OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          readyToStart = true;
                          isLoading = true;
                        });
                        await getMessage();
                        setState(() {
                          isLoading = false;
                        });
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
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: readyToStart,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 300,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        isLoading
                            ? "Please wait\nThe game is loading"
                            : error
                                ? "Something went wrong\nTry again"
                                : "Are you ready to play?",
                        style: const TextStyle(
                          fontFamily: Constants.fontFamily,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    isLoading
                        ? const SpinKitSpinningLines(color: Colors.black)
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return error
                                        ? const HangManCategoryPage()
                                        : const HangmanPage();
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(251, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: const BorderSide(
                                color: Color(0xff3E87FF),
                                width: 3,
                              ),
                            ),
                            child: Text(
                              error ? "Return" : "Let's go!",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: Constants.fontFamily,
                                color: Colors.green,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldWidget(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        controller: inputController,
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
          suffix: IconButton(
            onPressed: () {
              setState(() {
                categories.add(inputController.text.toUpperCase());
                inputController.clear();
              });
            },
            icon: const Icon(
              Icons.send,
              color: Colors.blue,
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
    );
  }

  Widget showChosenCategories(String s) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            categories.remove(s);
          });
        },
        child: Text(
          s,
          style: const TextStyle(color: Colors.blue, fontSize: 10),
        ),
      ),
    );
  }

  Widget incrementButton() {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (cnt > 1) {
                  cnt--;
                }
              });
            },
            icon: Visibility(
              visible: cnt > 1,
              child: const Icon(
                Icons.remove,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ),
          Text(
            "$cnt",
            style: const TextStyle(
              fontFamily: Constants.fontFamily,
              fontSize: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (cnt < 9) {
                  cnt++;
                }
              });
            },
            icon: Visibility(
              visible: cnt < 9,
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryButton(
      String name, bool selected, double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: OutlinedButton(
        onPressed: () {
          !selected ? categories.add(name) : categories.remove(name);
          setState(() {});
        },
        style: OutlinedButton.styleFrom(
          fixedSize: Size(width * 0.7, height * 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: const BorderSide(
            color: Color(0xff3E87FF),
            width: 3,
          ),
          backgroundColor: selected ? Colors.grey[300] : null,
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontFamily: Constants.fontFamily,
            fontSize: 22,
            color: Color(0xff42B462),
          ),
        ),
      ),
    );
  }

  Future<void> getMessage() async {
    // final contentResponse = await APIService.getMessage(Game.message);
    try {
      Game.cnt = cnt;
      Game.categories = categories;
      final String category = categories[0];
      // print(category);
      print(cnt);
      final contentResponse = await hangmanApiCall(Game.getPrompt(category));
      print(contentResponse);

      Game.guessed = 0;
      Game.words.clear();
      Game.descriptions.clear();
      Game.hints.clear();

      for (int i = 0; i < cnt; i++) {
        // print(contentResponse[category][i]['word']);
        Game.words.add(contentResponse[i]['word']);
        // print(contentResponse[category][i]['description']);
        Game.descriptions.add(contentResponse[i]['description']);
        // print(contentResponse[category][i]['hints'] as List);
        Game.hints.add(List<String>.from(contentResponse[i]['hints'] as List));
      }
    } catch (e) {
      error = true;
      log("Something went wrong");
      log(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman_and_texttwist/hangman/hangman_page.dart';
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
        title: const Text('Category list'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xff3E87FF),
                          width: 8,
                        ),
                      ),
                      height: screenHeight * 0.8,
                      width: screenWidth * 0.9,
                      child: SingleChildScrollView(
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
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                textFieldWidget(screenHeight, screenWidth),
                                IconButton(
                                  onPressed: () {
                                    categories.add(
                                        inputController.text.toUpperCase());
                                    inputController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_sharp,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: List<Widget>.from(
                                categories.map(
                                  (e) => showChosenCategories(e),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
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
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: readyToStart,
            child: Positioned(
              top: 150,
              left: 40,
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
                            ? "Please wait\n The game is loading"
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HangmanPage(),
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
                            child: const Text(
                              "Let's go!",
                              style: TextStyle(
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
          )
        ],
      ),
    );
  }

  Widget textFieldWidget(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.7,
      height: screenHeight * 0.06,
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
          print(categories);
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
    String _categories = '';
    for (String category in categories) {
      _categories += '$category, ';
    }
    // final contentResponse = await APIService.getMessage(Game.message);
    final contentResponse =
        await hangmanApiCall(Game.getPrompt(_categories, cnt));
    // print(contentResponse);

    Game.words.clear();
    Game.descriptions.clear();
    Game.hints.clear();
    Game.categories.clear();

    for (String category in categories) {
      for (int i = 0; i < cnt; i++) {
        Game.words.add(contentResponse[category]?[i]['word']);
        Game.categories.add(category);
        Game.descriptions.add(contentResponse[category]?[i]['description']);
        Game.hints.add(
            List<String>.from(contentResponse[category]?[i]['hints'] as List));
      }
    }
  }
}

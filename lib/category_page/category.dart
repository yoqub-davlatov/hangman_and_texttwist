import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../text_twist/text_twist_page.dart';
import '../category_page/category_button.dart';
import '../constants/games.dart';
import 'category_settings.dart';

class CategoryPage extends StatefulWidget {
  final Games game;

  const CategoryPage({Key? key, required this.game}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  callbackSetSelected() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xff3E87FF),
            width: 3.0,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape: const CircleBorder(),
          backgroundColor: const Color(0xffFFFB00),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
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
                      color: Colors.transparent,
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
                        children: List<Widget>.from(
                                Settings.categoriesList.map((e) {
                              return categoryButton(e, Settings.selected == e,
                                  callbackSetSelected);
                            }).toList()) +
                            List<Widget>.from([
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
                                  onChanged: (text) {
                                    setState(() {
                                      Settings.selected = "";
                                    });
                                  },
                                  controller: Settings.inputCategoryController,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontFamily: Constants.fontFamily,
                                    color: Color(0xff42B462),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0.0),
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
                            ])),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TextTwist(category: Settings.selected),
                        ),
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

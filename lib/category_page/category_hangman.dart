import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HangManCategoryPage extends StatefulWidget {
  const HangManCategoryPage({super.key});

  @override
  State<HangManCategoryPage> createState() => _HangManCategoryPageState();
}

class _HangManCategoryPageState extends State<HangManCategoryPage> {
  String selected = "";
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
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xff3E87FF),
                  width: 8,
                ),
              ),
              height: screenHeight * 0.8,
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<Widget>.from(
                      categoryList.map(
                        (name) => categoryButton(
                          name,
                          categories.contains(name),
                          screenHeight * 0.07,
                          screenWidth * 0.6,
                        ),
                      ),
                    ),
                  ),
                  textFieldWidget(screenHeight, screenWidth)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldWidget(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.7,
      height: screenHeight * 0.06,
      child: TextFormField(
        onChanged: (text) {
          setState(() {
            selected = "";
          });
        },
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

  Widget categoryButton(
      String name, bool selected, double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          !selected ? categories.add(name) : categories.remove(name);
          print(categories);
          setState(() {});
        },
        style: OutlinedButton.styleFrom(
          fixedSize: Size(width, height),
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
}

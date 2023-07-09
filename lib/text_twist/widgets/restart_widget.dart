import 'package:flutter/material.dart';

import '../../constants/constants.dart';

Widget RestartWidget(BuildContext context, bool passed, bool show) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Visibility(
    visible: show,
    child: SizedBox(
      height: screenHeight * 0.20,
      width: screenWidth * 0.96,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff3E87FF),
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(
              Constants.bckgrImagePath,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              passed ? "Congratulations!" : "Game Over!",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontFamily: 'KristenITC',
              ),
            ),
            Text(
              passed
                  ? "You have guessed everything!"
                  : "You gave up!",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'KristenITC',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "New Game",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'KristenITC',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFFFB00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                    color: Color(0xff3E87FF),
                    width: 2,
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

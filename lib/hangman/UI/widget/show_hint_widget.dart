import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

Widget showHintWidget(bool showDescription, final String hint, final callBack) {
  return Visibility(
    visible: showDescription,
    child: Center(
      child: Container(
        margin: const EdgeInsets.only(bottom:80),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 5,
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
                hint,
                style: const TextStyle(
                  fontFamily: Constants.fontFamily,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: callBack,
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
                "Got it!",
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
  );
}

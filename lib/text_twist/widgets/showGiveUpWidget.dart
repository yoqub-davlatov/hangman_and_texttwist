import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

Widget showGiveUpWidget(
    bool isGiveUp, final setGiveUpFalse, final setGiveUpTrue) {
  return Visibility(
    visible: isGiveUp,
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
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                """Are you sure you want to give up and see the correct answers?""",
                style:
                    TextStyle(fontSize: 20, fontFamily: Constants.fontFamily),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: setGiveUpFalse,
                  child: const Text(
                    "No",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: Constants.fontFamily,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: setGiveUpTrue,
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: Constants.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

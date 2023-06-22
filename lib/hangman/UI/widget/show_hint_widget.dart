import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

Widget showHintWidget(bool showHint, final String hint, final callBack) {
  return Visibility(
    visible: showHint,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 200,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            hint,
            style: const TextStyle(
              fontFamily: Constants.fontFamily,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: callBack,
            child: const Text(
              "Ok",
              style: TextStyle(
                fontSize: 20,
                fontFamily: Constants.fontFamily,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

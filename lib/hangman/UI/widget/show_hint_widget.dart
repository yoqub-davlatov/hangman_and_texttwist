import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/constants.dart';

Widget showHintWidget(
    bool isFetching, bool showHint, final String hint, final callBack) {
  return Visibility(
    visible: showHint,
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
              child: isFetching
                  ? const SpinKitFadingCube(color: Colors.black)
                  : Text(
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
    ),
  );
}

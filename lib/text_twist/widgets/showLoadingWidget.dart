import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/constants.dart';

Widget showLoadingWidget(
    bool isLoading) {
  return Visibility(
    visible: isLoading,
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                """Loading""",
                style:
                    TextStyle(fontSize: 20, fontFamily: Constants.fontFamily),
              ),
            ),
            SpinKitSpinningLines(color: Colors.black)
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

Widget letter(String character, bool hidden) {
  return character == ' '
      ? Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
        )
      : Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: hidden ? Colors.white : Colors.green,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Visibility(
            visible: !hidden,
            child: Text(
              character,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: Constants.fontFamily,
                fontSize: 25.0,
              ),
            ),
          ),
        );
}

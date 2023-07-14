import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

Widget categoryWidget(String category) {
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(30),
    ),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        category,
        style: const TextStyle(
          fontFamily: Constants.fontFamily,
          fontSize: 26,
        ),
      ),
    ),
  );
}

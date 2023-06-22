import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

Widget levelWidget(int round) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      shape: BoxShape.circle,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "$round",
          style: const TextStyle(
            fontFamily: Constants.fontFamily,
            fontSize: 26,
          ),
        ),
      ],
    ),
  );
}

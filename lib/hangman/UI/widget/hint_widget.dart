import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

Widget diamondWidget(int coins) {
  return Container(
    width: 118,
    height: 38,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "$coins",
          style: const TextStyle(
            fontFamily: Constants.fontFamily,
            fontSize: 24,
          ),
        ),
        const Icon(
          Icons.diamond,
          color: Colors.red,
        ),
      ],
    ),
  );
}

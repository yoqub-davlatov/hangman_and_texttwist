import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

Widget pointsWidget(int points) {
  return Container(
    width: 118,
    height: 38,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber),
        Text(
          "$points",
          style: const TextStyle(
            fontFamily: Constants.fontFamily,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}

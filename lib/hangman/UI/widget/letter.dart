import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: AppColors.primaryColorDark,
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
          fontSize: 30.0,
        ),
      ),
    ),
  );
}

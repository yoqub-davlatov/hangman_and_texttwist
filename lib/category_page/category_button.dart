import 'package:flutter/material.dart';
import '../constants/constants.dart';

OutlinedButton categoryButton(String name) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(251, 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: const BorderSide(
        color: Color(0xff3E87FF),
        width: 3,
      ),
    ),
    child: Text(
      name,
      style: const TextStyle(
        fontFamily: Constants.fontFamily,
        fontSize: 22,
        color: Color(0xff42B462),
      ),
    ),
  );
}

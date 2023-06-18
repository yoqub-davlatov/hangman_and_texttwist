import 'package:flutter/material.dart';
import '../constants/constants.dart';

OutlinedButton categoryButton(String name) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(200, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: const BorderSide(
        color: Colors.blue,
        width: 3,
      ),
    ),
    child: Text(
      name,
      style: const TextStyle(
        fontFamily: Constants.fontFamily,
        fontSize: 20,
        color: Colors.green,
      ),
    ),
  );
}

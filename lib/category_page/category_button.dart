import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'category_settings.dart';

OutlinedButton categoryButton(String name, bool selected, Function callback) {
  return OutlinedButton(
    onPressed: () {
      Settings.inputCategoryController.clear();
      Settings.selected = name;
      callback();
    },
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(251, 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: BorderSide(
        color: selected ? Colors.yellow : const Color(0xff3E87FF),
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

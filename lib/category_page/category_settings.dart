import 'package:flutter/material.dart';


class Settings {
  static TextEditingController inputCategoryController = TextEditingController();
  static List categoriesList = ["Food", "Anime", "Movies", "Sport", "Astronomy", "History"];
  static String selected = categoriesList.first;
}
import 'package:flutter/material.dart';

Widget letter(String character, bool selected) {
  return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          character,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'KristenITC',
            fontSize: 25.0,
          ),
        ),
      ));
}

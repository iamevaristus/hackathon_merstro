import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MTexts{
  static TextStyle authForm(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      color: MColors.black,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle hints(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      color: MColors.greyed,
      fontWeight: FontWeight.bold
    );
  }
}
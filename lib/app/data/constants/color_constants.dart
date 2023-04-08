import 'package:flutter/material.dart';

class ConstantsColor {

  ///green gradient
  static const Gradient topToDownGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromRGBO(141, 245, 77, 1), Color.fromRGBO(16, 137, 0, 1)]
  );

  static const Gradient leftToRightGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color.fromRGBO(141, 245, 77, 1), Color.fromRGBO(16, 137, 0, 1)]
  );

  static const Color themeColor = Colors.green;

  ///black gradient
  static const Gradient topToDownBlackGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromRGBO(187, 187, 187, 1), Color.fromRGBO(28, 28, 28, 1)]
  );
}
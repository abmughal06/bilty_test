import 'package:flutter/material.dart';

class Sizes {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double blockSize(BuildContext context) =>
      MediaQuery.of(context).size.width / 100;
}

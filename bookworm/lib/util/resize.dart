import 'package:flutter/material.dart';

class Resize {
  static const double _width = 412;
  static const double _height = 732;
  double _relativeWidth;
  double _relativeHeight;

  void getWidthAndHeight(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _relativeWidth = MediaQuery.of(context).size.width;
      _relativeHeight = MediaQuery.of(context).size.height;
    } else {
      _relativeWidth = MediaQuery.of(context).size.height;
      _relativeHeight = MediaQuery.of(context).size.width;
    }
  }

  double get widthScale => _relativeWidth / _width;
  double get heightScale => _relativeHeight / _height;
  double getFontScale(num font) => widthScale * font;
  double getWidth(num width) => width * widthScale;
  double getHeight(num height) => height * heightScale;
}

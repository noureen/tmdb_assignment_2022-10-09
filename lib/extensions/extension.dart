import 'package:flutter/cupertino.dart';

extension SizeHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double getDimension(context, double unit) {
    if (width <= 360.0) {
      return unit / 1.3;
    } else {
      return unit;
    }
  }
}
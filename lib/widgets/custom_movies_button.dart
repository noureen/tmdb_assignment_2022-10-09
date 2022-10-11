import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../styles/styles.dart';

class CustomMoviesButton extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsetsGeometry? padding;

  CustomMoviesButton({
    required this.text,
    required this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      label: Text(text, style: mediumTextWhite),
    );
  }
}

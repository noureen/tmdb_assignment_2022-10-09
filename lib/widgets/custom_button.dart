import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../styles/styles.dart';

class CustomButton extends StatelessWidget {
  final Color borderColor;
  final double borderRadius;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData? icon;
  final String title;
  final Function()? onPress;

  const CustomButton({
    Key? key,
    required this.borderColor,
    required this.borderRadius,
    required this.foregroundColor,
    required this.backgroundColor,
    this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? (MediaQuery.of(context).size.width / 2.5) / 2.2
          : MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? 12.0.h
          : 6.0.h,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
          ),
          onPressed: onPress,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      (icon)!,
                      color: Colors.white,
                    ),
                    _buildText(context)
                  ],
                )
              : _buildText(context)),
    );
  }

  Widget _buildText(BuildContext context) => Text(
        title ?? '',
        style: mediumTextWhite.copyWith(
            fontSize:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 12.0.sp
                    : 18.0.sp),
      );
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
      child: Padding(
        padding: EdgeInsets.only(right: 1.h, left: 1.h),
        child: const Divider(
          height: 1.0,
        ),
      ),
    );
  }
}

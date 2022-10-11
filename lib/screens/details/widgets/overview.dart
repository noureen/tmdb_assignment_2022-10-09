import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../styles/styles.dart';

class OverView extends StatelessWidget {
  final String? overview;

  const OverView({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Padding(
          padding:
              EdgeInsets.only(right: 1.h, left: 1.h, bottom: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                    fontWeight: weight500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0.sp,
                    color: textColorTopHead,
                    fontFamily: 'PoppinsMedium'),
              ),

              SizedBox(height: 1.0.h,),
              Text(
                overview ?? '',
                style: TextStyle(
                    fontWeight: weight500,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0.sp,
                    color: overViewColor,
                    fontFamily: 'PoppinsRegular'),
              ),
            ],
          )),
    );
  }
}

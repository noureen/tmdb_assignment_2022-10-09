import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import '../../../data/model/movie_detail/genres.dart';
import '../../../styles/styles.dart';
import '../../../widgets/custom_movies_button.dart';

class Generes extends StatelessWidget {
  final List<Genres>? genres;

  const Generes({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Padding(
          padding: EdgeInsets.only(right: 1.h, left: 1.h, top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Generes',
                style: TextStyle(
                    fontWeight: weight500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0.sp,
                    color: textColorTopHead,
                    fontFamily: 'PoppinsMedium'),
              ),
              SizedBox(height: 1.0.h),
              _buildGeneres(genres, context)
            ],
          )),
    );
  }

  _buildGeneres(List<Genres>? genres, BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 0,
          maxHeight: 150,
        ),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5.0,
            direction: Axis.horizontal,
            children: (getGenresList(genres)),
          ),
        ));
  }

  List<CustomMoviesButton> getGenresList(List<Genres>? genres) {
    List<CustomMoviesButton> temp = [];
    genres?.map((genre) {
      temp.add(
        CustomMoviesButton(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          text: genre.name ?? '',
        ),
      );
    }).toList();

    return temp;
  }
}

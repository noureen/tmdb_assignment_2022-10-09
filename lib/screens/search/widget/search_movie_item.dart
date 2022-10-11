import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/styles/styles.dart';

import '../../../constants/constants.dart';
import '../../../constants/endpoints.dart';
import '../../../data/model/movies/movies_model.dart';

class SearchMovieItem extends StatelessWidget {
  const SearchMovieItem({
    required this.movie,
  });

  final MoviesModel? movie;

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {

      var padding = 12.0;
      if (MediaQuery.of(context).size.width > 700) {
        var mod = MediaQuery.of(context).size.width - 700;
        padding = mod / 2.0;
      }


      return Padding(
        padding: EdgeInsets.only(
            right: padding, left: padding, top: 8.0, bottom: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildImage(context),
                text,
                icon,
              ],
            ),
            space,
          ],
        ),
      );
    });
  }

  Widget _buildImage(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 24.0.w
            : 34.0.w,
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? 44.0.h
            : 16.0.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: AspectRatio(
            aspectRatio: 9 / 14,
            child: CachedNetworkImage(
              imageUrl: '${Endpoints.imageUrl}${movie?.backdropPath ?? ''}',
              fit: BoxFit.fitHeight,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  progressView,
              errorWidget: (context, url, error) => errorView,
            ),
          ),
        ),
      );

  Widget get text => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            movie?.title ?? '',
            style: TextStyle(
                fontWeight: weight500,
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp,
                color: textColorTopHead,
                fontFamily: 'PoppinsMedium'),
          ),
        ),
      );

  Widget get icon => InkWell(
        onTap: () {},
        child: const Icon(
          Icons.more_horiz,
          color: menuBgColor2,
        ),
      );

  Widget get space => Padding(
        padding: const EdgeInsets.only(
          left: 100,
          right: 16,
        ),
        child: Container(
          height: 10,
        ),
      );

  Widget get errorView => SizedBox(
        width: 34.0.w,
        height: 16.0.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: AspectRatio(
            aspectRatio: 9 / 14,
            child: Image.asset(
              Assets.tmdbPlaceholder,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget get progressView => const Center(
        child: CircularProgressIndicator(color: menuBgColor2),
      );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/constants/endpoints.dart';
import '../../../constants/constants.dart';
import '../../../data/model/movies/movies_model.dart';
import '../../../styles/styles.dart';

class MovieListItem extends StatelessWidget {
  final MoviesModel? movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return InkWell(
          onTap: () {
            Get.toNamed('/detail', arguments: {"movie_id": movie?.id});
          },
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [_buildImage(MediaQuery.of(context).orientation, context), text],
            ),
          ));
    });
  }

  Widget get text => Container(
        padding: EdgeInsets.all(28.0.px),
        child: Text(
          movie?.originalTitle ?? '',
          maxLines: 1,
          style: TextStyle(
              fontWeight: weight500,
              fontStyle: FontStyle.normal,
              fontSize: 18.0.sp,
              color: whiteColor,
              fontFamily: 'PoppinsMedium'),
        ),
      );

  Widget _buildImage(Orientation orientation, BuildContext context) =>
      Container(
        height: orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height / 1.1
            : MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: kElevationToShadow[8]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 9 / 14,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => errorView,
              imageUrl: '${Endpoints.imageUrl}${movie?.backdropPath ?? ''}',
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  progressView,
            ),
          ),
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

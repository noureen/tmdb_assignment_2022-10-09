import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/constants/endpoints.dart';
import 'package:the_movies_db_app/data/model/movie_detail/genres.dart';
import '../../../constants/constants.dart';
import '../../../styles/styles.dart';

class GenreListItem extends StatelessWidget {
  final Genres? genre;

  GenreListItem({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return InkWell(
        onTap: () {},
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 2,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [_buildImage(orientation, context), text],
          ),
        ));
  }

  Widget get text => Container(
        padding: EdgeInsets.all(8.0.px),
        child: Text(
          genre?.name ?? '',
          maxLines: 1,
          style: TextStyle(
              fontWeight: weight500,
              fontStyle: FontStyle.normal,
              fontSize: 16.0.sp,
              color: whiteColor,
              fontFamily: 'PoppinsMedium'),
        ),
      );

  Widget _buildImage(Orientation orientation, BuildContext context) => SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 34.0.w
            : 42.0.w,
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? 42.0.h
            : 34.0.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: AspectRatio(
            aspectRatio: 9 / 14,
            child: CachedNetworkImage(
              imageUrl: '${Endpoints.imageUrl}${''}',
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  progressView,
              errorWidget: (context, url, error) => errorView,
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

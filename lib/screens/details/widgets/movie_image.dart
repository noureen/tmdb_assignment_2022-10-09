import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/data/model/movie_video/movie_video.dart';
import 'package:the_movies_db_app/screens/details/widgets/logo.dart';
import 'package:the_movies_db_app/styles/styles.dart';
import 'package:the_movies_db_app/utils/utility.dart';
import 'package:the_movies_db_app/widgets/custom_button.dart';

import '../../../constants/endpoints.dart';

class MovieImage extends StatelessWidget {
  final String? image;
  final String? logoPath;
  final String? releaseDate;
  final MovieVideo? trailer;

  const MovieImage(
      {Key? key,
      required this.image,
      this.releaseDate,
      this.logoPath,
      this.trailer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width / 2.5
        : MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.height / 2.5;

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (CachedNetworkImageProvider(
                  '${Endpoints.imageUrl}${image ?? ''}',
                )),
                fit: BoxFit.cover)),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (Utility.isSet(logoPath)) ...[
              MovieLogo(
                logoPath: logoPath,
              ),
              vSpace
            ],
            if (Utility.isSet(releaseDate)) ...[
              Text(
                '$strInTheaters ${Utility.getDateByMonthName(Utility.convertStrDateToDate(releaseDate ?? ''))}',
                style: mediumTextWhite.copyWith(fontSize: 18.0.sp),
              ),
              vSpace,
            ],
            MediaQuery.of(context).orientation == Orientation.landscape
                ? _buildMovieActionsLandscape()
                : _buildMovieActionsPortrait(),
          ],
        ),
      ),
    );
  }

  _buildMovieActionsPortrait() {
    return Column(
      children: [
        CustomButton(
            onPress: () {},
            borderColor: Colors.blue,
            borderRadius: 8.0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            title: strGetTickets),
        vSpace,
        if (trailer != null) ...[
          CustomButton(
            onPress: () {
              Get.toNamed('/trailer',
                  arguments: {"trailer": Utility.jsonToString(trailer)});
            },
            borderColor: Colors.blue,
            borderRadius: 8.0,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: strWatchTrailer,
            icon: Icons.play_arrow,
          ),
        ]
      ],
    );
  }

  _buildMovieActionsLandscape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            onPress: () {},
            borderColor: Colors.blue,
            borderRadius: 8.0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            title: strGetTickets),
        hSpace,
        if (trailer != null) ...[
          CustomButton(
            onPress: () {
              Get.toNamed('/trailer',
                  arguments: {"trailer": Utility.jsonToString(trailer)});
            },
            borderColor: Colors.blue,
            borderRadius: 8.0,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: strWatchTrailer,
            icon: Icons.play_arrow,
          ),
        ]
      ],
    );
  }

  Widget get vSpace => SizedBox(
        height: 2.0.h,
      );

  Widget get hSpace => SizedBox(
        width: 2.0.h,
      );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/endpoints.dart';

class MovieLogo extends StatelessWidget {
  final String? logoPath;

  const MovieLogo({Key? key, required this.logoPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? 12.0.h
          : 5.0.h,
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? 22.0.w
          : 40.0.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => _buildErrorView(context),
          imageUrl: '${Endpoints.imageUrl}${logoPath ?? ''}',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(14.0),
    child: AspectRatio(
      aspectRatio: 9 / 14,
      child: Image.asset(
        Assets.tmdbPlaceholder,
        fit: BoxFit.cover,
      ),
    ),
  );
}

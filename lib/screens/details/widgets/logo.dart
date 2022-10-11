import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        child:  CachedNetworkImage(
            imageUrl: '${Endpoints.imageUrl}${logoPath ?? ''}',
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              color: Colors.grey.shade900,
            ),
          ),

      ),
    );
  }
}

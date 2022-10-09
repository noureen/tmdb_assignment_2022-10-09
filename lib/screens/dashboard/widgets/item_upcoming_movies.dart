import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movies_db_app/constants/endpoints.dart';
import 'package:the_movies_db_app/utils/utility.dart';

import '../../../data/model/upcoming_movies/upcoming_movies_model.dart';

class MovieListItem extends StatelessWidget {
  final UpcomingMoviesModel? movie;
  double width = 0;
  double height = 0;

  MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(width: double.infinity,child:
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
            '${Endpoints.imageUrl}${movie?.posterPath ?? ''}',
          ),),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie?.title ?? '',
            ),
          )
        ],
      ),
    );
  }
}

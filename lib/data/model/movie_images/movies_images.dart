import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_image_detail.dart';
part 'movies_images.g.dart';

@JsonSerializable(explicitToJson: true)
class MoviesImages extends Equatable {
  List<MovieImageDetail>? backdrops;
  int? id;
  List<MovieImageDetail>? logos;
  List<MovieImageDetail>? posters;

  MoviesImages({this.backdrops, this.id, this.logos, this.posters});

  factory MoviesImages.fromJson(Map<String, dynamic> json) =>
      _$MoviesImagesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesImagesToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [backdrops, id, logos, posters];

}

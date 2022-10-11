import '../movie_detail/genres.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenreResponse extends Equatable {
  @JsonKey(name: 'genres')
  List<Genres>? genres;

  GenreResponse({this.genres});

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [genres];
}

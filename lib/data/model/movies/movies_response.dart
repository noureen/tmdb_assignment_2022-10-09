import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movies_model.dart';

part 'movies_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MoviesResponse extends Equatable {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MoviesModel>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  MoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [page, results, totalPages, totalResults];
}

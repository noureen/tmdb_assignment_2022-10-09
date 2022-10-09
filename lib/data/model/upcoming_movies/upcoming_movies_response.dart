import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movies_db_app/data/model/upcoming_movies/upcoming_movies_model.dart';
part 'upcoming_movies_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpcomingMoviesResponse extends Equatable {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<UpcomingMoviesModel>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  UpcomingMoviesResponse(
      {
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});


  factory UpcomingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMoviesResponseToJson(this);


  @override
  // TODO: implement props
  List<Object?> get props => [
    page,
    results,
    totalPages,
    totalResults
  ];

}

import 'package:the_movies_db_app/data/model/movie_detail/production_companies.dart';
import 'package:the_movies_db_app/data/model/movie_detail/production_countries.dart';
import 'package:the_movies_db_app/data/model/movie_detail/spoken_languages.dart';

import 'genres.dart';


import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'movie_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetail  extends Equatable {
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  String? belongsToCollection;
  @JsonKey(name: 'budget')
  int? budget;
  @JsonKey(name: 'genres')
  List<Genres>? genres;
  @JsonKey(name: 'homepage')
  String? homepage;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountries>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'revenue')
  int? revenue;
  @JsonKey(name: 'runtime')
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguages>? spokenLanguages;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'tagline')
  String? tagline;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieDetail(
      {this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
    adult,
    backdropPath,
    belongsToCollection,
    budget,
    genres,
    homepage,
    id,
    imdbId,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    productionCompanies,
    productionCountries,
    releaseDate,
    revenue,
    runtime,
    spokenLanguages,
    status,
    tagline,
    title,
    video,
    voteAverage,
    voteCount
  ];



}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMoviesResponse _$UpcomingMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    UpcomingMoviesResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UpcomingMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$UpcomingMoviesResponseToJson(
        UpcomingMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

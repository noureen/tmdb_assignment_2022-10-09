// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesImages _$MoviesImagesFromJson(Map<String, dynamic> json) => MoviesImages(
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => MovieImageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      logos: (json['logos'] as List<dynamic>?)
          ?.map((e) => MovieImageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>?)
          ?.map((e) => MovieImageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesImagesToJson(MoviesImages instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'logos': instance.logos?.map((e) => e.toJson()).toList(),
      'posters': instance.posters?.map((e) => e.toJson()).toList(),
    };

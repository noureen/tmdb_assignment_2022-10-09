import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_image_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieImageDetail extends Equatable {
  @JsonKey(name: 'aspect_ratio')
  double? aspectRatio;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'file_path')
  String? filePath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'width')
  int? width;

  MovieImageDetail({this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width});


  factory MovieImageDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieImageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageDetailToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [aspectRatio,
    height,
    iso6391,
    filePath,
    voteAverage,
    voteCount,
    width];
}

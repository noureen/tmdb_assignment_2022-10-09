import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@JsonSerializable(explicitToJson: true)
class Genres extends Equatable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages.g.dart';

@JsonSerializable(explicitToJson: true)
class SpokenLanguages extends Equatable {
  @JsonKey(name: 'english_name')
  String? englishName;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'name')
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [englishName, iso6391, name];
}

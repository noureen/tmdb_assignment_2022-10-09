import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_countries.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductionCountries extends Equatable {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  @JsonKey(name: 'name')
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [iso31661, name];
}

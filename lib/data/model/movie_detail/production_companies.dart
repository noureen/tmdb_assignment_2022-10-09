

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'production_companies.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductionCompanies  extends Equatable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'origin_country')
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);


  @override
  // TODO: implement props
  List<Object?> get props => [id, logoPath, name, originCountry];


}
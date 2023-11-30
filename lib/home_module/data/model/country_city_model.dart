// To parse this JSON data, do
//
//     final countryCityModel = countryCityModelFromJson(jsonString);

import 'dart:convert';

CountryCityModel countryCityModelFromJson(String str) => CountryCityModel.fromJson(json.decode(str));

String countryCityModelToJson(CountryCityModel data) => json.encode(data.toJson());

class CountryCityModel {
  List<Datum>? data;

  CountryCityModel({
    this.data,
  });

  factory CountryCityModel.fromJson(Map<String, dynamic> json) => CountryCityModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? iso2;
  String? iso3;
  String? country;
  List<String>? cities;

  Datum({
    this.iso2,
    this.iso3,
    this.country,
    this.cities,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    iso2: json["iso2"],
    iso3: json["iso3"],
    country: json["country"],
    cities: json["cities"] == null ? [] : List<String>.from(json["cities"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "iso2": iso2,
    "iso3": iso3,
    "country": country,
    "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
  };
}

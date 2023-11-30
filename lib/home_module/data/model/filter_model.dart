// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  bool? stateIsFilterActive;
  int? minPrice;
  int? maxPrice;
  String? languageOffer;

  FilterModel({
    this.stateIsFilterActive,
    this.minPrice,
    this.maxPrice,
    this.languageOffer,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    stateIsFilterActive: json["stateIsFilterActive"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    languageOffer: json["languageOffer"],
  );

  Map<String, dynamic> toJson() => {
    "stateIsFilterActive": stateIsFilterActive,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
    "languageOffer": languageOffer,
  };
}

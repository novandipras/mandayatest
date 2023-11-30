
class SearchFormModel {
  SearchForm? searchForm;

  SearchFormModel({
    this.searchForm,
  });

  factory SearchFormModel.fromJson(Map<String, dynamic> json) =>
      SearchFormModel(
        searchForm: json["search_form"] == null
            ? null
            : SearchForm.fromJson(json["search_form"]),
      );

  Map<String, dynamic> toJson() => {
        "search_form": searchForm?.toJson(),
      };
}

class SearchForm {
  DateTrip? dateTrip;
  CitySelection? citySelection;
  GuestCount? guestCount;

  SearchForm({
    this.dateTrip,
    this.citySelection,
    this.guestCount,
  });

  factory SearchForm.fromJson(Map<String, dynamic> json) => SearchForm(
        dateTrip: json["date_trip"] == null
            ? null
            : DateTrip.fromJson(json["date_trip"]),
        citySelection: json["city_selection"] == null
            ? null
            : CitySelection.fromJson(json["city_selection"]),
        guestCount: json["guest_count"] == null
            ? null
            : GuestCount.fromJson(json["guest_count"]),
      );

  Map<String, dynamic> toJson() => {
        "date_trip": dateTrip?.toJson(),
        "city_selection": citySelection?.toJson(),
        "guest_count": guestCount?.toJson(),
      };
}

class CitySelection {
  bool? isFlexible;
  String? country;
  String? city;

  CitySelection({
    this.isFlexible,
    this.country,
    this.city,
  });

  factory CitySelection.fromJson(Map<String, dynamic> json) => CitySelection(
        isFlexible: json["is_flexible"],
        country: json["country"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "is_flexible": isFlexible,
        "country": country,
        "city": city,
      };
}

class DateTrip {
  String? date;
  bool? isAnytime;

  DateTrip({
    this.date,
    this.isAnytime,
  });

  factory DateTrip.fromJson(Map<String, dynamic> json) => DateTrip(
        date: json["date"],
        isAnytime: json["is_anytime"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "is_anytime": isAnytime,
      };
}

class GuestCount {
  int? children;
  int? adult;
  int? infant;

  GuestCount({
    this.children,
    this.adult,
    this.infant,
  });

  factory GuestCount.fromJson(Map<String, dynamic> json) => GuestCount(
        children: json["children"],
        adult: json["adult"],
        infant: json["infant"],
      );

  Map<String, dynamic> toJson() => {
        "children": children,
        "adult": adult,
        "infant": infant,
      };
}

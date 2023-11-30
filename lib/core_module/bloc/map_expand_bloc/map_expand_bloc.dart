import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';

part 'map_expand_event.dart';

part 'map_expand_state.dart';

class MapExpandBloc extends Bloc<MapExpandEvent, MapExpandState> {
  MapExpandBloc() : super(MapExpandState.initial()) {
    on<InitMapExpandEvent>((event, emit) {
      emit(MapExpandState(
        listDataExperienceOnMap: listDataExperienceOnMap['data'],
        searchFormModel: event.searchFormModel,
        selectedExperience: null,
      ));
    });
    on<SelectMarker>((event, emit) {
      emit(MapExpandState(
        listDataExperienceOnMap: state.listDataExperienceOnMap,
        searchFormModel: state.searchFormModel,
        selectedExperience: event.experience,
      ));
    });
  }
}

Map<String, dynamic> listDataExperienceOnMap = {
  "data": List.generate(10, (index) {

    List imageList = [
      "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
      "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
      "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
    ];
    imageList.shuffle();
    return {
      "id_experience": "a$index",
      "name": "NEW! A-Frame House in Minami Karuizawa",
      "title": "$index Entire home in Shimonita, Kanra District, Japan",
      "type": "cabins",
      "image": imageList,
      "is_favorite": false,
      "available_date": [
        {
          "start": "2023-11-26 19:30:00.183",
          "end": "2023-12-03 19:30:00.183",
        },
        {
          "start": "2023-12-24 19:30:00.183",
          "end": "2023-12-27 19:30:00.183",
        },
        {
          "start": "2023-12-28 19:30:00.183",
          "end": "2024-01-7 19:30:00.183",
        },
      ],
      "rating": 4.8,
      "people_count": Random().nextInt(5000).round(),
      "hosted_name": "Hitogami",
      "expected_price": {
        "price": Random().nextInt(5000).round(),
        "currency": "\$",
        "price_per": "day",
      },
      "address": {
        "address_name": "〒370-2627 Gunma",
        "sub_district": "Shimonita",
        "district": "Kanra",
        "city": "Nishinomaki",
        "postal_code": "370-2627",
        "country": "Japan",
        "latitude": 36.2988321 + (Random().nextDouble() / 10),
        "longitude": 138.6506315 + (Random().nextDouble() / 10)
      }
    };
  })
};

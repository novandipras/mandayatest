import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/home_module/data/model/filter_model.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/bloc/explore_screen_bloc/explore_screen_config.dart';

part 'explore_screen_event.dart';

part 'explore_screen_state.dart';

class ExploreScreenBloc extends Bloc<ExploreScreenEvent, ExploreScreenState> {
  ExploreScreenBloc() : super(ExploreScreenState.initial()) {
    on<ChangeCategory>((event, emit) {
      emit(state.copyWith(selectedCategory: event.data));
    });

    on<InitSearchExplore>((event, emit) {
      emit(state.copyWith(searchFormModel: event.data, searchResult: {
        "list_banner": listBannerDummy,
        "all_result_item": allResultItemDummy,
      }));
    });
  }
}

List<Map<String, dynamic>> listBannerDummy = [
  {
    "title": "Daily Experience hosted by local",
    "child_banner": {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "type": "video",
      "id_experience": "a1"
    },
    "slide_experience": [
      {
        "id_experience": "a1",
        "name": "NEW! A-Frame House in Minami Karuizawa",
        "title": "Entire home in Shimonita, Kanra District, Japan",
        "type": "cabins",
        "image": [
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
        ],
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
        "people_count": 12,
        "hosted_name": "Hitogami",
        "expected_price": {
          "price": 480,
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
          "latitude": 36.2988321,
          "longitude": 138.6506315
        }
      },
      {
        "id_experience": "a2",
        "name": "Old! A-Frame House in Minami Karuizawa",
        "title": "Entire home in Shimonita, Kanra District, Japan",
        "type": "cabins",
        "image": [
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
        ],
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
        "rating": 4.2,
        "people_count": 122,
        "hosted_name": "Mako",
        "expected_price": {
          "price": 420,
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
          "latitude": 36.2988325,
          "longitude": 138.6506317
        }
      },
    ]
  },
  {
    "title": "Monthly Experience hosted by local",
    "child_banner": {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      "type": "video",
      "id_experience": "a4"
    },
    "slide_experience": [
      {
        "id_experience": "a1",
        "name": "NEW! A-Frame House in Minami Karuizawa",
        "title": "Entire home in Shimonita, Kanra District, Japan",
        "type": "cabins",
        "image": [
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
        ],
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
        "people_count": 12,
        "hosted_name": "Hitogami",
        "expected_price": {
          "price": 480,
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
          "latitude": 36.2988321,
          "longitude": 138.6506315
        }
      },
      {
        "id_experience": "a2",
        "name": "Old! A-Frame House in Minami Karuizawa",
        "title": "Entire home in Shimonita, Kanra District, Japan",
        "type": "cabins",
        "image": [
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
          "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
        ],
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
        "rating": 4.2,
        "people_count": 122,
        "hosted_name": "Mako",
        "expected_price": {
          "price": 420,
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
          "latitude": 36.2988325,
          "longitude": 138.6506317
        }
      },
    ]
  }
];

Map<String, dynamic> allResultItemDummy = {
  "total": 10,
  "next_page_param": null,
  "prev_page_param": null,
  "data": List.generate(10, (index) {
    return {
      "id_experience": "a$index",
      "name": "NEW! A-Frame House in Minami Karuizawa",
      "title": "Entire home in Shimonita, Kanra District, Japan",
      "type": "cabins",
      "image": [
        "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/7139b18e-c04b-42e8-a16a-65d3c6a65302.jpeg",
        "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/9849f714-d065-4c04-8b12-08b006b38a23.jpeg",
        "https://a0.muscache.com/im/pictures/miso/Hosting-706258318201976784/original/dc54e5d3-807d-4cba-8d92-6c3b43705586.jpeg",
      ],
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
      "people_count": 12,
      "hosted_name": "Hitogami",
      "expected_price": {
        "price": 480,
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
        "latitude": 36.2988321 + (index/100000),
        "longitude": 138.6506315 + (index/100000)
      }
    };
  })
};

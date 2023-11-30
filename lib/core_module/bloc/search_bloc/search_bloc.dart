import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_place_config.dart';
import 'package:mandayatest/core_module/utils/app_event.dart';
import 'package:mandayatest/home_module/data/model/country_city_model.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<InitSearch>(
      (event, emit) => emit(SearchState.initial()),
    );

    on<ClearAll>((event, emit) {
      add(const InitSearch());
    });

    on<SetSearch>(
      (event, emit) {
        emit(SearchState(
          searchFormModel: event.data,
          listResult: state.listResult,
          destinationText: state.destinationText,
        ));
      },
    );

    on<TypingSearch>((event, emit) {
      emit(SearchState(
        destinationText: event.data,
        listResult: state.listResult,
        searchFormModel: state.searchFormModel,
      ));
      add(const SearchPlace());
    }, transformer: AppEvent.appDebounce(const Duration(milliseconds: 2000)));

    on<SearchPlace>((event, emit) async {
      List<DataCity>? resultCity = [];
      if (state.destinationText!.isNotEmpty) {
        resultCity =
            CountryCityModel.fromJson(SearchPlaceConfig.stateCountryCity)
                .data
                ?.fold([], (previousValue, element) {
          List<DataCity> tempData = [];

          if (element.country!
              .toLowerCase()
              .contains(state.destinationText!.toLowerCase())) {
            tempData.add(DataCity(country: element.country));
          }

          element.cities?.forEach((e) {
            if (e
                .toLowerCase()
                .contains((state.destinationText ?? '').toLowerCase())) {
              tempData.add(DataCity(city: e, country: element.country));
            }
          });

          return tempData.isEmpty
              ? previousValue
              : [...previousValue, ...tempData];
        });
      } else {
        resultCity = [];
      }
      emit(SearchState(
        destinationText: state.destinationText,
        listResult: resultCity,
        searchFormModel: state.searchFormModel,
      ));
    });

    on<ClearListSearch>(
      (event, emit) => emit(SearchState(
        destinationText: state.destinationText,
        searchFormModel: state.searchFormModel,
        listResult: const [],
      )),
    );

    on<ChangeWhosComing>(
      (event, emit) {
        Map<String, dynamic>? mappingGuestMap = state
            .searchFormModel?.searchForm?.guestCount
            ?.toJson()
            .map((key, value) =>
                MapEntry(key, (key == event.key) ? event.data : value));

        emit(SearchState(
          destinationText: state.destinationText,
          listResult: state.listResult,
          searchFormModel: SearchFormModel(
              searchForm: SearchForm(
            citySelection: state.searchFormModel?.searchForm?.citySelection,
            dateTrip: state.searchFormModel?.searchForm?.dateTrip,
            guestCount: GuestCount.fromJson(mappingGuestMap!),
          )),
        ));
      },
    );
    on<ChangeDateSearch>(
      (event, emit) {
        emit(SearchState(
          destinationText: state.destinationText,
          listResult: state.listResult,
          searchFormModel: SearchFormModel(
              searchForm: SearchForm(
            citySelection: state.searchFormModel?.searchForm?.citySelection,
            dateTrip: DateTrip(
              date: event.data,
              isAnytime: false,
            ),
            guestCount: state.searchFormModel?.searchForm?.guestCount,
          )),
        ));
      },
    );

    on<ChangeDestinationAddress>(
      (event, emit) {
        emit(SearchState(
          destinationText: state.destinationText,
          listResult: state.listResult,
          searchFormModel: SearchFormModel(
              searchForm: SearchForm(
            citySelection: CitySelection(
              isFlexible: event.isFlexible,
              city: event.city,
              country: event.country,
            ),
            dateTrip: state.searchFormModel?.searchForm?.dateTrip,
            guestCount: state.searchFormModel?.searchForm?.guestCount,
          )),
        ));
      },
    );
  }
}

class DataCity {
  DataCity({
    this.city,
    this.country,
  });

  String? city;
  String? country;
}

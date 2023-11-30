part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.destinationText,
    this.listResult,
    this.searchFormModel,
  });

  final String? destinationText;
  final SearchFormModel? searchFormModel;
  final List<DataCity>? listResult;

  factory SearchState.initial() {
    return SearchState(
      searchFormModel: SearchFormModel(
        searchForm: SearchForm(
          guestCount: GuestCount(children: 0, adult: 0, infant: 0),
          citySelection: CitySelection(
            isFlexible: true,
            city: null,
            country: null,
          ),
          dateTrip: DateTrip(
            isAnytime: true,
            date: null,
          ),
        ),
      ),
      destinationText: null,
      listResult: const [],
    );
  }

  @override
  List<Object?> get props => [
        destinationText,
        listResult,
        searchFormModel,
      ];
}

part of 'explore_screen_bloc.dart';

class ExploreScreenState extends Equatable {
  const ExploreScreenState({
    required this.selectedCategory,
    required this.listCategory,
    required this.listExperience,
    this.searchFormModel,
    this.filterModel,
    this.searchResult,
  });

  final Map<String, dynamic> selectedCategory;
  final List<Map<String, dynamic>> listCategory;
  final List<Map<String, dynamic>> listExperience;
  final SearchFormModel? searchFormModel;
  final FilterModel? filterModel;
  final Map<String, dynamic>? searchResult;

  factory ExploreScreenState.initial() {
    return ExploreScreenState(
      selectedCategory:
          ExploreScreenConfig.stateExploreScreen['list_category'].first,
      listCategory: ExploreScreenConfig.stateExploreScreen['list_category'],
      listExperience: ExploreScreenConfig.stateExploreScreen['list_experience'],
      filterModel: FilterModel(
        stateIsFilterActive: false,
        languageOffer: null,
        maxPrice: null,
        minPrice: null,
      )
    );
  }

  ExploreScreenState copyWith({
    Map<String, dynamic>? selectedCategory,
    List<Map<String, dynamic>>? listCategory,
    List<Map<String, dynamic>>? listExperience,
    SearchFormModel? searchFormModel,
    FilterModel? filterModel,
    Map<String, dynamic>? searchResult,
  }) {
    return ExploreScreenState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      listCategory: listCategory ?? this.listCategory,
      listExperience: listExperience ?? this.listExperience,
      searchFormModel: searchFormModel ?? this.searchFormModel,
      filterModel: filterModel ?? this.filterModel,
      searchResult: searchResult ?? this.searchResult,
    );
  }

  @override
  List<Object?> get props => [
        selectedCategory,
        listCategory,
        listExperience,
        searchFormModel,
        filterModel,
        searchResult,
      ];
}

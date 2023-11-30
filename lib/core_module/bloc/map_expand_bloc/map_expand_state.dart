part of 'map_expand_bloc.dart';

class MapExpandState  {
  const MapExpandState({
    this.selectedExperience,
    this.searchFormModel,
    this.listDataExperienceOnMap,
  });

  final List<Map<String, dynamic>>? listDataExperienceOnMap;
  final Map<String, dynamic>? selectedExperience;
  final SearchFormModel? searchFormModel;

  factory MapExpandState.initial() {
    return const MapExpandState(
      selectedExperience: null,
      searchFormModel: null,
    );
  }
}

part of 'map_expand_bloc.dart';

abstract class MapExpandEvent extends Equatable {
  const MapExpandEvent();
}

class InitMapExpandEvent extends MapExpandEvent {
  const InitMapExpandEvent({this.searchFormModel});

  final SearchFormModel? searchFormModel;

  @override
  List<Object?> get props => [
        searchFormModel,
      ];
}

class SelectMarker extends MapExpandEvent {
  const SelectMarker({
    this.experience,
  });

  final Map<String, dynamic>? experience;

  @override
  List<Object?> get props => [experience];
}

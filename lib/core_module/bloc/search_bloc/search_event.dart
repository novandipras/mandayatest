part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class TypingSearch extends SearchEvent {
  const TypingSearch({this.data});

  final String? data;

  @override
  List<Object?> get props => [
        data,
      ];
}

class ClearAll extends SearchEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

}

class InitSearch extends SearchEvent {
  const InitSearch();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetSearch extends SearchEvent {
  const SetSearch({this.data});

  final SearchFormModel? data;

  @override
  List<Object?> get props => [
        data,
      ];
}

class SearchPlace extends SearchEvent {
  const SearchPlace();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ClearListSearch extends SearchEvent {
  const ClearListSearch();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ChangeWhosComing extends SearchEvent {
  const ChangeWhosComing({
    this.data,
    this.key,
  });

  final int? data;
  final String? key;

  @override
  List<Object?> get props => [
        data,
        key,
      ];
}

class ChangeDateSearch extends SearchEvent {
  const ChangeDateSearch({
    this.data,
  });

  final String? data;

  @override
  List<Object?> get props => [
        data,
      ];
}

class ChangeDestinationAddress extends SearchEvent {
  const ChangeDestinationAddress({
    this.city,
    this.country,
    this.isFlexible = false,
  });

  final String? city;
  final String? country;
  final bool isFlexible;

  @override
  List<Object?> get props => [
        city,
        country,
        isFlexible,
      ];
}

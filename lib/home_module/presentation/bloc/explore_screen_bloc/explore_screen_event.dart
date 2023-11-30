part of 'explore_screen_bloc.dart';

abstract class ExploreScreenEvent extends Equatable {
  const ExploreScreenEvent();
}

class ChangeCategory extends ExploreScreenEvent {
  const ChangeCategory(this.data);

  final Map<String, dynamic> data;

  @override
  List<Object?> get props => [
        data,
      ];
}

class InitSearchExplore extends ExploreScreenEvent {
  const InitSearchExplore({this.data});

  final SearchFormModel? data;

  @override
  List<Object?> get props => [
        data,
      ];
}

part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent extends Equatable {
  const BottomNavbarEvent();
}

class ChangeIndex extends BottomNavbarEvent {
  const ChangeIndex({
    this.index,
    this.isVisible = true,
  });

  final int? index;
  final bool? isVisible;

  @override
  List<Object?> get props => [
        index,
        isVisible,
      ];
}
class ChangeVisible extends BottomNavbarEvent {
  const ChangeVisible({
    this.isVisible = true,
  });

  final bool? isVisible;

  @override
  List<Object?> get props => [
        isVisible,
      ];
}

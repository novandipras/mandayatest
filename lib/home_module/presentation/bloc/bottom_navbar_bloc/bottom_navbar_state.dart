part of 'bottom_navbar_bloc.dart';

class BottomNavbarState extends Equatable {
  const BottomNavbarState({
    this.index,
    this.isVisible,

  });

  final int? index;
  final bool? isVisible;


  factory BottomNavbarState.initial() {
    return const BottomNavbarState(
      index: 0,
      isVisible: true,
    );
  }

  @override
  List<Object?> get props => [
        index,
        isVisible,
      ];
}

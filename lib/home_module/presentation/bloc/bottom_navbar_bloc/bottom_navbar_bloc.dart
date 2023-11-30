import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navbar_event.dart';

part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(BottomNavbarState.initial()) {
    on<ChangeIndex>((event, emit) {
      emit(BottomNavbarState(
        isVisible: event.isVisible,
        index: event.index,
      ));
    });
    on<ChangeVisible>((event, emit) {
      emit(BottomNavbarState(
        isVisible: event.isVisible,
        index: state.index,
      ));
    });
  }
}

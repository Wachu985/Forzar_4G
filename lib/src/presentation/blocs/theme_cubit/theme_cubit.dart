import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/shared_preferences/shared_preferences_singlenton.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());
  final preferences = SharedPreferencesSinglenton();

  void initLoading() {
    emit(state.copyWith(
        darkMode: preferences.themeStatus, acepted: preferences.warningStatus));
  }

  void warningAcepted(bool acepted) {
    preferences.warningStatus = acepted;
    emit(state.copyWith(acepted: acepted));
  }

  void changeTheme() {
    preferences.themeStatus = !state.darkMode;
    emit(state.copyWith(darkMode: !state.darkMode));
  }
}

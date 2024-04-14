part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool darkMode;
  final bool acepted;
  const ThemeState({this.darkMode = false, this.acepted = false});

  ThemeState copyWith({bool? darkMode, bool? acepted}) => ThemeState(
      darkMode: darkMode ?? this.darkMode, acepted: acepted ?? this.acepted);

  @override
  List<Object> get props => [darkMode, acepted];
}

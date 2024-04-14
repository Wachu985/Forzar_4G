import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSinglenton {
  //==========Patron Singlenton=============
  static final SharedPreferencesSinglenton _instancia =
      SharedPreferencesSinglenton._internal();

  factory SharedPreferencesSinglenton() {
    return _instancia;
  }

  SharedPreferencesSinglenton._internal();
  //==========Patron Singlenton=============

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET
  bool get themeStatus {
    return _prefs!.getBool('darkMode') ?? false;
  }

  set themeStatus(bool value) {
    _prefs!.setBool('darkMode', value);
  }

  bool get warningStatus {
    return _prefs!.getBool('acepted') ?? false;
  }

  set warningStatus(bool value) {
    _prefs!.setBool('acepted', value);
  }
}

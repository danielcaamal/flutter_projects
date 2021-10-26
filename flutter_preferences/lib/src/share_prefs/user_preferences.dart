import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // KEYS
  final String _gender = 'GENDER';
  final String _secondaryColor = 'SECONDARY_COLOR';
  final String _username = 'USERNAME';
  final String _lastPage = 'LAST_PAGE';

  // Singleton
  static final UserPreferences _instance = UserPreferences._();
  factory UserPreferences() => _instance;
  UserPreferences._();
  late SharedPreferences _prefs;

  // Initialize preferences
  initPrefs() async => _prefs = await SharedPreferences.getInstance();

  // Setters and Getters
  int get gender => _prefs.getInt(_gender) ?? 1;
  set gender(int value) => _prefs.setInt(_gender, value);

  bool get secondaryColor => _prefs.getBool(_secondaryColor) ?? false;
  set secondaryColor(bool value) => _prefs.setBool(_secondaryColor, value);

  String get username => _prefs.getString(_username) ?? '';
  set username(String value) => _prefs.setString(_username, value);

  String get lastPage => _prefs.getString(_lastPage) ?? 'Home';
  set lastPage(String value) => _prefs.setString(_lastPage, value);
}

import 'package:shared_preferences/shared_preferences.dart';

// Reference  : https://www.youtube.com/watch?v=szOllHT1S7Y

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUserLoggedIn = "isUserLoggedIn";
  static const _keyUserEmailId = "emailId";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future setUserLoggedIn(bool userLoggedIn) async =>
      await _preferences.setBool(_keyUserLoggedIn, userLoggedIn);

  static bool? getIsUserLoggedIn() => _preferences.getBool(_keyUserLoggedIn);


  static Future setEmailId(String emailId) async =>
      await _preferences.setString(_keyUserEmailId, emailId);

  static String? getEmailId() => _preferences.getString(_keyUserEmailId);
}

import 'package:shared_preferences/shared_preferences.dart';

class PrefController {
  saveUserData(String username, String email) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("username", username);
    _prefs.setString("email", email);
  }
}

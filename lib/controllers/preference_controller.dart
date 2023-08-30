import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/mobile/login_page.dart';

class PreferenceController {
  static addPreference(
      {required String phone,
      required String accountId,
      required String email,
      required String username,
      required String profileImageName,
      required String cAbbrev,
      required String aboutMe}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
    prefs.setString('accountId', accountId);
    prefs.setString('email', email);
    prefs.setString('username', username);
    prefs.setString('profileImageName', profileImageName);
    prefs.setString("cAbbrev", cAbbrev);
    prefs.setString("aboutMe", aboutMe);
  }

  static clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.to(
      () => LoginActivity(
        backButtonEnabled: true,
      ),
    );
  }

  static editPreferences(
      {required String phone, required String username}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
    prefs.setString('username', username);
  }

  static saveToken(
      {required String token, required String refreshToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('refreshToken', refreshToken);
  }
}

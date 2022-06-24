import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AuthService {
  static late SharedPreferences _preferences;
  static late StreamingSharedPreferences _streamingPreferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
    _streamingPreferences = await StreamingSharedPreferences.instance;
  }

  static final Preference<bool> authPreference = _streamingPreferences.getBool('auth', defaultValue: false);

  static void auth(bool auth) async => await _streamingPreferences.setBool('auth', auth);

  static String? getPassword(String username) => _preferences.getString(username);

  static void setPassword(String username, String password) async => await _preferences.setString(username, password);

  static Future<void> createUser(String username, String password, String fullname, String email, String language,
      List<String> pets, List<String> interests) async {
    await _preferences.setString(username, password);
    await _preferences.setString('_____username', username);
    await _preferences.setString('_____fullname', fullname);
    await _preferences.setString('_____email', email);
    await _preferences.setString('_____language', language);
    await _preferences.setStringList('_____pets', pets);
    await _preferences.setStringList('_____interests', interests);
  }

  static String? get username => _preferences.getString('_____username');

  static String? get fullname => _preferences.getString('_____fullname');

  static String? get email => _preferences.getString('_____email');

  static String? get language => _preferences.getString('_____language');

  static List<String>? get pets => _preferences.getStringList('_____pets');

  static List<String>? get interests => _preferences.getStringList('_____interests');
}

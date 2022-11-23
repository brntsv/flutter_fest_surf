import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  final bool isSwitched;

  Settings(this.isSwitched);
}

class NotificationDataProvider {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<Settings> loadValue() async {
    final isSwitched =
        (await sharedPreferences).getBool('is_switched') ?? false;
    return Settings(isSwitched);
  }

  Future<void> saveValue(Settings toggle) async {
    (await sharedPreferences).setBool('is_switched', toggle.isSwitched);
  }
}

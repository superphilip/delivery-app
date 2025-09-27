import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSaveLocalStorageRepository extends SaveLocalStorageRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveInLocalStorage({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({
    required String key,
    required List<String> value,
  }) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(key, value);
  }
}

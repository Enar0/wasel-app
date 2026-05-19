import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(AppConstants.userBox);
    await Hive.openBox(AppConstants.settingsBox);
    await Hive.openBox(AppConstants.recentPlacesBox);
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    final box = Hive.box(AppConstants.userBox);
    await box.put('current_user', userData);
  }

  Map<String, dynamic>? getUser() {
    final box = Hive.box(AppConstants.userBox);
    final data = box.get('current_user');
    if (data != null) {
      return Map<String, dynamic>.from(data);
    }
    return null;
  }

  Future<void> clearUser() async {
    final box = Hive.box(AppConstants.userBox);
    await box.delete('current_user');
  }

  Future<void> setLanguage(String languageCode) async {
    final box = Hive.box(AppConstants.settingsBox);
    await box.put('language', languageCode);
  }

  String getLanguage() {
    final box = Hive.box(AppConstants.settingsBox);
    return box.get('language') ?? 'ar';
  }
}

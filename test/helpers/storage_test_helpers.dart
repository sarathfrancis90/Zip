import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zlynkr/core/services/storage_service.dart';

/// Initialises [StorageService] against mocked SharedPreferences and a fresh
/// Hive directory. Returns the temp dir so tests can delete it in tearDown.
Future<Directory> initTestStorage({Map<String, Object> prefs = const {}}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final sharedPrefs = await SharedPreferences.getInstance();
  final dir = await Directory.systemTemp.createTemp('zlynkr_test_');
  await StorageService.initializeForTest(hivePath: dir.path, prefs: sharedPrefs);
  return dir;
}

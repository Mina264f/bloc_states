import 'package:hive_flutter/adapters.dart';
import 'package:validform/person_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
    await Hive.openBox<Person>(HiveServiceKeys.user);
  }

  static Future<void> saveData(String key, dynamic value, String boxName) async {
    var box = await _openBoxIfNeeded(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> getData(String key, String boxName) async {
    var box = await _openBoxIfNeeded(boxName);
    return box.get(key);
  }

  static Future<Box> _openBoxIfNeeded(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}




class HiveServiceKeys {
  static const String user = 'user';
}
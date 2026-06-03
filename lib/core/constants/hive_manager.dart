import 'package:hive_ce_flutter/hive_flutter.dart';
import '../constants/hive_keys.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Buka semua box yang dibutuhkan
    await Hive.openBox<String>(HiveKeys.employeeBox);
    await Hive.openBox<String>(HiveKeys.profileBox);
  }

  static Box<String> get employeeBox =>
      Hive.box<String>(HiveKeys.employeeBox);

  static Box<String> get profileBox =>
      Hive.box<String>(HiveKeys.profileBox);
}
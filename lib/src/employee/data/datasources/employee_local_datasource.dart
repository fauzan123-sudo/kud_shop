import 'dart:convert';

import 'package:flutter_ui_playground/core/constants/hive_keys.dart';
import 'package:flutter_ui_playground/core/error/exception.dart';
import 'package:flutter_ui_playground/src/employee/data/models/employee_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class EmployeeLocalDataSource {
  Future<List<EmployeeModel>> getCachedEmployees();
  Future<void> cacheEmployees(List<EmployeeModel> employees);
  Future<void> clearCache();
}

class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {
  final Box<String> box;

  EmployeeLocalDataSourceImpl(this.box);

  @override
  Future<List<EmployeeModel>> getCachedEmployees() async {
    final jsonString = box.get(HiveKeys.cachedEmployees);

    if (jsonString == null) throw CacheException();

    final List<dynamic> jsonList =
        json.decode(jsonString) as List<dynamic>;

    return jsonList
        .map((e) => EmployeeModel.fromJson(
              Map<String, dynamic>.from(e as Map),
            ))
        .toList();
  }

  @override
  Future<void> cacheEmployees(List<EmployeeModel> employees) async {
    // Konversi manual ke Map yang aman untuk di-encode
    final jsonList = employees.map((e) => _toSafeJson(e)).toList();
    box.put(HiveKeys.cachedEmployees, json.encode(jsonList));
  }

  @override
  Future<void> clearCache() async {
    box.delete(HiveKeys.cachedEmployees);
  }

  // Konversi EmployeeModel ke Map yang aman untuk json.encode
  Map<String, dynamic> _toSafeJson(EmployeeModel e) {
    return {
      'id':        e.id,
      'firstName': e.firstName,
      'lastName':  e.lastName,
      'email':     e.email,
      'phone':     e.phone,
      'image':     e.image,
      'company':   Map<String, dynamic>.from(e.company),
    };
  }
}

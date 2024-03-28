import 'dart:convert';
import 'package:injectable/injectable.dart';
import '/services/storage/const/storage_const.dart';
import 'exceptions/shared_pref_storage_exception.dart';
import '../storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@StorageConst.sharedPrefStorage
@Singleton(as: Storage)
class SharedPrefStorage implements Storage {
  final SharedPreferences storage;

  SharedPrefStorage(this.storage);

  @override
  Future<void> add(
      {required String key, required Map<String, dynamic> data}) async {
    final value =  storage.getString(key);

    if (value == null) {
      await storage.setString(key, jsonEncode(data));
    } else {
      throw SharedPrefStorageException('Data with key: [$key] exists!',
          stackTrace: StackTrace.current);
    }
  }

  @override
  Future<Map<String, dynamic>?> get(String key,
      {String? value, String? by}) async {
    final String? value =  storage.getString(key);

    if (value != null) {
      return jsonDecode(value);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({required String key}) async {
    throw UnimplementedError('SharedPreferences cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<List<Map<String, dynamic>>> getAllWhere(
      {required String key, required String value, required String by}) async {
    throw UnimplementedError('SharedPreferences cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<void> replace(String key,
      {String? value,
      String? by,
      required Map<String, dynamic> replaceData}) async {
    await storage.setString(key, jsonEncode(replaceData));
  }

  @override
  Future<void> replaceAll(
      {required String key, required List<Map<String, dynamic>> data}) {
    throw UnimplementedError('SharedPreferences cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<void> remove({required String key, String? value, String? by}) async {
    await storage.remove(key);
  }
}

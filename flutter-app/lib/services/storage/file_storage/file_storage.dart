import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../file_service/file_service.dart';
import '/services/storage/const/storage_const.dart';
import '../storage.dart';

@StorageConst.fileStorage
@Singleton(as: Storage)
class FileStorage implements Storage {
  final String subDirectoryName = 'log';
  final FileService service;

  FileStorage(this.service);

  @override
  Future<void> add(
      {required String key, required Map<String, dynamic> data}) async {
    await service.updateFile(
        dirName: subDirectoryName, fileName: key, data: data.toString());
  }

  @override
  Future<Map<String, dynamic>?> get(String key,
      {String? value, String? by}) async {
    final file =
    await service.getFile(dirName: subDirectoryName, fileName: key);

    if (file.existsSync()) {
      final content = await file.readAsString();
      return jsonDecode(content);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({required String key}) async {
    throw UnimplementedError('FileStorage cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<List<Map<String, dynamic>>> getAllWhere(
      {required String key, required String value, required String by}) async {
    throw UnimplementedError('FileStorage cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<void> replace(String key,
      {String? value,
        String? by,
        required Map<String, dynamic> replaceData}) async {
    final file =
    await service.getFile(dirName: subDirectoryName, fileName: key);
    await file.writeAsString(jsonEncode(replaceData));
  }

  @override
  Future<void> replaceAll(
      {required String key, required List<Map<String, dynamic>> data}) {
    throw UnimplementedError('FileStorage cannot contain multiple '
        'values in the same key');
  }

  @override
  Future<void> remove({required String key, String? value, String? by}) async {
    final file =
    await service.getFile(dirName: subDirectoryName, fileName: key);

    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  Future<void> removeAll({required String key}) async {
    await service.deleteDirectory(dirName: subDirectoryName);
  }
}

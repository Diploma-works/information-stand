import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../file_service.dart';

@LazySingleton(as: FileService)
class QbicFileService implements FileService {
  final PathProviderPlatform _path;

  QbicFileService(this._path);

  @override
  Future<File> getFile(
      {required String dirName, required String fileName}) async {
    final Directory directory = await _getDirectory(name: dirName);

    return File('${directory.path}/$fileName');
  }

  @override
  Future<List<File>> getFiles({required String dirName})  async {

    final dir = await getDirectory(name: dirName);
    final List<FileSystemEntity> entities = await dir.list().toList();

    return entities.whereType<File>().toList();


  }

  Future<void> updateFile(
      {required String dirName,
        required String fileName,
        required String data}) async {
    File file = await getFile(dirName: dirName, fileName: fileName);

    if (file.existsSync()) {
      String value = '\n$data';

      log('Записываю данные: $value', name: 'FileService');

      await file.writeAsString(
        value,
        mode: FileMode.writeOnlyAppend,
      );
    } else {
      String value = '$data';

      log('Создал файл для записи данных: $value', name: 'FileService');

      file.createSync();
      file.writeAsStringSync(
        value,
        mode: FileMode.writeOnlyAppend,
      );
    }
  }

  @override
  Future<void> saveFile(
      {required File file,
        required String dirName,
        required String fileName}) async {
    final Directory directory = await _getDirectory(name: dirName);

    await file.copy('${directory.path}/$fileName');
  }

  @override
  Future<void> saveFromUint8List(
      {required Uint8List bytes,
        required String dirName,
        required String fileName}) async {
    final Directory directory = await _getDirectory(name: dirName);

    File file = await File('${directory.path}/$fileName').create();

    await file.writeAsBytes(bytes);
  }

  Future<Directory> _getDirectory({required String name}) async {
    String? path = await _path.getExternalStoragePath();

    if (path != null) {
      path = path.replaceAll('/storage/emulated/0', '/sdcard');

      return await Directory('$path/$name').create();
    } else {
      throw Exception('Такого пути нет');
    }
  }

  @override
  Future<Directory> getDirectory({required String name}) async {
    String? path = await _path.getExternalStoragePath();

    if (path != null) {
      path = path.replaceAll('/storage/emulated/0', '/sdcard');

      return await Directory('$path/$name').create();
    } else {
      throw Exception('Такого пути нет');
    }
  }

  @override
  Future<void> deleteDirectory({required String dirName}) async {
    try {
      final Directory directory = await _getDirectory(name: dirName);
      if (await directory.exists()) {
        await directory.delete(recursive: true);
      }
    } catch (e) {
      throw Exception('Ошибка при удалении директории: $e');
    }
  }

  @override
  Future<void> deleteFile({required String path}) async {
    try {
      final File file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception('Ошибка при удалении файла: $e');
    }
  }

  @override
  Future<num> getDirectorySize({required String dirName}) async {
    final logDir = await getDirectory(name: dirName);
    if (logDir.existsSync()) {
      int totalSize = 0;
      await for (var entity in logDir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
      return totalSize / 1024;
    }
    return 0;
  }

  @override
  Future<void> initAssets(List<String> paths) async {
    final dir = await getDirectory(name: 'assets');

    for (String path in paths) {
      var filePath = '${dir.path}/${basename(path)}';

      if (!await File(filePath).exists()) {
        final byteData = await rootBundle.load(path);

        var newPath = '${dir.path}/${basename(path)}';

        File newFile = await File(newPath).create(recursive: true);
        newFile.writeAsBytes(byteData.buffer.asUint8List());

        log('Создал файл у файла из asset: $newPath');
      } else {
        log('Файл существует по пути: $filePath');
      }
    }
  }

  @override
  Future<File?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      withReadStream: true,
      type: FileType.media,
      withData: true,
    );

    if (result != null) {
      var path = result.files.first.path;

      if (path != null) {
        return File(path);
      } else {
        return null;
      }
    }
    return null;
  }

}

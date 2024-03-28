import 'dart:io';
import 'dart:typed_data';

  abstract interface class FileService {
  Future<void> saveFile(
  {required File file, required String dirName, required String fileName});

  Future<File> getFile({required String dirName, required String fileName});
  Future<List<File>> getFiles({required String dirName});

  Future<void> updateFile(
  {required String dirName,
  required String fileName,
  required String data});

  Future<void> saveFromUint8List(
  {required Uint8List bytes,
  required String dirName,
  required String fileName});

  Future<Directory> getDirectory({required String name});

  Future<void> deleteDirectory({required String dirName});

  Future<void> deleteFile({required String path});

  Future<num> getDirectorySize({required String dirName});

  ///
  /// * Загрузка файлов из asset папки во внутреннюю память устройства
  ///
  Future<void> initAssets(List<String> paths);

  ///
  /// * Выбор картинки из файловой системы
  ///
  Future<File?> pickImage();

}
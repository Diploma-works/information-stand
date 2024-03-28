import 'package:information_stand/services/storage/const/storage_const.dart';
import 'package:information_stand/ui/services/color_storage/color_storage.dart';
import 'package:information_stand/ui/ui_kit/color/mainColorKit/main_color_kit.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/storage/storage.dart';
import '../../../ui_kit/color/color_kit.dart';

@Singleton(as: ColorStorage)
class ColorKitStorageImpl implements ColorStorage {
  final Storage _storage;
  static const String key = 'color_kit';

  ColorKitStorageImpl(@StorageConst.sharedPrefStorage this._storage);

  @override
  Future<void> save(ColorKit kit) async {
    await _storage.replace(key, replaceData: kit.toJson());
  }

  @override
  Future<ColorKit?> get() async {
    final data = await _storage.get(key);

    if (data != null) {
      return MainColorKit.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> clear() async {
    await _storage.remove(key: key);
  }
}

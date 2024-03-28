import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';
import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui_impl/main_layout_ui_impl.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/storage/storage.dart';
import '../main_layout_storage.dart';
import 'package:information_stand/services/storage/const/storage_const.dart';

@Singleton(as: MainLayoutStorage)
class MainLayoutStorageImpl implements MainLayoutStorage {
  final Storage _storage;
  static const String key = 'main_layout_ui';

  MainLayoutStorageImpl(@StorageConst.sharedPrefStorage this._storage);

  @override
  Future<void> save(MainLayoutUi mainLayoutUi) async {
    await _storage.replace(key, replaceData: mainLayoutUi.toJson());
  }

  @override
  Future<MainLayoutUi?> get() async {
    final data = await _storage.get(key);

    if (data != null) {
      return MainLayoutUiImpl.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> clear() async {
    await _storage.remove(key: key);
  }
}

import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:injectable/injectable.dart';
import '/services/storage/const/storage_const.dart';
import '/services/storage/storage.dart';


@Singleton()
class ConfigStorage {
  Storage storage;

  static const key = 'config';

  ConfigStorage(@StorageConst.sharedPrefStorage this.storage);

  Future<Config?> getConfig() async {

    final data = await storage.get(key);

    if (data != null) {
      return  Config.fromJson(data);
    }

    return null;
  }

  Future<void> setConfig(Config config) async {
    await storage.replace(key, replaceData: config.toJson());
  }

  Future<void> clear() async {
    await storage.remove(key: key);
  }
}

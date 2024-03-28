abstract interface class LicenseServiceInterface {

  Future<bool> get license;

  ///
  /// * Проверка лицензии
  ///
  Future<bool> check();


}
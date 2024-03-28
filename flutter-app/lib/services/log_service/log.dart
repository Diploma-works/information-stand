/// * Логирование
///
/// [message] - Сообщение лога
///
/// [time] - Время лога (Опционально)
///
/// [stackTrace] (Опционально)
///
///

abstract interface class Log {
  /// * Дебаг.
  /// Вызывается при дебаге. Для вывода лога при разработке.
  ///
  ///
  Future<void> d(dynamic message, {DateTime? time, StackTrace? stackTrace});

  /// * Информация.
  ///
  /// Информационный лог. Низкий приоритет
  ///
  /// Пример: Log.w('Получены пользовательские данные')
  Future<void> i(dynamic message, {DateTime? time, StackTrace? stackTrace});

  /// * Внимание.
  ///
  /// Предупреждающий лог. Средний приоритет. Лог для ошибок, которые
  /// не влияют на функциональность
  ///
  /// Пример: Log.w('Загружены старые данные')
  Future<void> w(dynamic message, {DateTime? time, StackTrace? stackTrace});

  /// * Ошибка.
  ///
  /// Высокий приоритет. Лог для вывода критических ошибок, влияют
  /// на функциональность
  ///
  /// Пример: Log.w('int is not type String...')
  Future<void> e(dynamic message, {DateTime? time, StackTrace? stackTrace});

  /// * Почему это не работает.
  ///
  /// ...
  Future<void> wtf(dynamic message, {DateTime? time, StackTrace? stackTrace});
}

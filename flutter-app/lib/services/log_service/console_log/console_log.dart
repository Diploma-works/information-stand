import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../const/log_service_const.dart';
import '../log.dart';


@LogServiceConst.console
@Singleton(as: Log)
class ConsoleLog implements Log {
  Logger logger;

  ConsoleLog(this.logger);

  @override
  Future<void> d(message, {DateTime? time, StackTrace? stackTrace})  async {
    logger.d(message, time: time, stackTrace: stackTrace);
  }

  @override
  Future<void> e(message, {DateTime? time, StackTrace? stackTrace}) async {
    logger.e(message, time: time, stackTrace: stackTrace);
  }

  @override
  Future<void> i(message, {DateTime? time, StackTrace? stackTrace}) async {
    logger.i(message, time: time, stackTrace: stackTrace);
  }

  @override
  Future<void> w(message, {DateTime? time, StackTrace? stackTrace}) async {
    logger.w(message, time: time, stackTrace: stackTrace);
  }

  @override
  Future<void> wtf(message, {DateTime? time, StackTrace? stackTrace}) async {
    logger.f(message, time: time, stackTrace: stackTrace);
  }
}

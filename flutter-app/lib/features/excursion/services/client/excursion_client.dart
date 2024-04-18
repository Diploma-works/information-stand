import 'package:dio/dio.dart';
import 'package:information_stand/features/excursion/const/excursion_const.dart';

import '../../../../services/dio_interceptors/log_interceptor/log_interceptor.dart';
import '../../../../services/log_service/log.dart';

Dio createExcursionClient(Log log) {
  return Dio(
    BaseOptions(
      validateStatus: (status) {
        return (status == 200) ? true : false;
      },
      baseUrl: ExcursionConst.baseUrl,
    ),
  )
    ..interceptors.addAll([LogDioInterceptor(log)]);
}
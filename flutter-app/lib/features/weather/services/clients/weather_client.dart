import 'package:dio/dio.dart';

import '../../../../services/dio_interceptors/log_interceptor/log_interceptor.dart';
import '../../../../services/log_service/log.dart';
import '../../const/weather_const.dart';

Dio createWeatherClient(Log log){

  return Dio(
    BaseOptions(
      validateStatus: (status){
        return (status == 200) ? true : false;
      },
      baseUrl: WeatherConst.baseUrl,
    ),
  )..interceptors.addAll([LogDioInterceptor(log)]);

}
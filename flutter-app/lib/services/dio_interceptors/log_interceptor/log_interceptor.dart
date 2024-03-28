import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../log_service/log.dart';

class LogDioInterceptor  implements Interceptor {

  Log log;

  String prettifyJson(Object? obj) => obj.toString();
      //const JsonEncoder.withIndent(' ').convert(obj);

  LogDioInterceptor(@Named('console') this.log);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.e(
      [
        'code:  ${prettifyJson(err.response?.statusCode)}',
        'error: ${prettifyJson(err.error)}',
        'message: ${prettifyJson(err.message)}',
        'data: ${prettifyJson(err.response?.data)}',
      ].join('\n'),
    );
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.d(
      [
        'headers:` ${options.headers}',
        'path: ${prettifyJson(options.path)}',
        'query: ${prettifyJson(options.queryParameters)}',
        'data: ${prettifyJson(options.data)}',
      ].join('\n'),
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d(
      [
        'path: ${prettifyJson(response.requestOptions.path)}',
        'data: ${prettifyJson(response.data)}',
      ].join('\n'),
    );
    handler.next(response);
  }


}
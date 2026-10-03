import 'package:dio/dio.dart';

import '../../utils/logger.dart';

/// Logs requests/responses/errors flowing through Dio.
final class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    AppLogger.d('API', '${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    AppLogger.d(
      'API',
      '${response.requestOptions.method} '
      '${response.requestOptions.uri} -> ${response.statusCode}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.e(
      'API',
      '${err.requestOptions.method} ${err.requestOptions.uri} '
      '-> ${err.response?.statusCode} ${err.message}',
    );
    handler.next(err);
  }
}
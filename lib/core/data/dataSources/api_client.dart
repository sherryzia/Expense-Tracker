import 'package:dio/dio.dart';

import '../../configs/app_config.dart';
import 'api_interceptor.dart';

/// Shared Dio client used by every feature data source.
final class ApiClient {
  ApiClient({Dio? dio})
      : _dio = dio ?? (Dio(_baseOptions)..interceptors.add(ApiInterceptor()));

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: AppConfig.networkTimeout,
    receiveTimeout: AppConfig.networkTimeout,
    sendTimeout: AppConfig.networkTimeout,
    headers: const {'Accept': 'application/json'},
  );

  final Dio _dio;

  Dio get instance => _dio;
}
import 'package:dio/dio.dart';

import '../dataSources/api_client.dart';

/// Base class for reusable cross-feature API services
/// (auth, common endpoints, etc.).
abstract class BaseService {
  BaseService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  /// Exposes the underlying Dio instance to subclasses.
  Dio get dio => _apiClient.instance;
}
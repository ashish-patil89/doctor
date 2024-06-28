// ignore_for_file: lines_longer_than_80_chars

import 'package:api_client/api_client.dart';

/// {@template feed_repository}
/// A repository for managing feed.
/// {@endtemplate}
class UserRepository {
  /// {@macro feed_repository}
  UserRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<void> getUsers({
    required String publicationId,
  }) async {
    try {
      await _apiClient.config.getUsers();
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }
}

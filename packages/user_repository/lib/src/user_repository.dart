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

  /// Login user with [email , password]
  Future<bool> signup({
    required String email,
    required String password,
    required String name,
    required int phone,
    required String dob,
    required String role,
  }) async {
    try {
      final success = await _apiClient.user.signup(
        email: email,
        password: password,
        name: name,
        phone: phone,
        role: role,
      );

      return success;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }

  /// Login user with [email , password]
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final success = await _apiClient.user.login(
        email: email,
        password: password,
      );

      return success;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }
}

import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';

/// {@template user_resource}
/// A resource for app configuration.
/// {@endtemplate}
class UserResource {
  /// {@macro user_resource}
  const UserResource({
    required Dio orbApiClient,
  }) : _orbApiClient = orbApiClient;

  final Dio _orbApiClient;

  /// Signup user with providing email,password,name,phone,role.
  Future<bool> signup({
    required String email,
    required String password,
    required String name,
    required int phone,
    required String role,
  }) async {
    try {
      final request = {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'role': role,
      };

      final response = await _orbApiClient.post<Map<String, dynamic>>(
        'api/v1/auth/signup',
        data: request,
      );

      log('[CommunityResource] getCommunities response: ${response.data}');

      return true;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
      return false;
    }
  }

  /// Login user with providing email,password,name,phone,role.
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = {
        'email': email,
        'password': password,
      };

      final response = await _orbApiClient.post<Map<String, dynamic>>(
        'api/v1/auth/login',
        data: request,
      );

      log('[CommunityResource] getCommunities response: ${response.data}');

      return true;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
      return false;
    }
  }
}

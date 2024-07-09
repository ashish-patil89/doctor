import 'dart:developer';
import 'dart:math' hide log;

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
  Future<String> signup({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final request = {
        'email': email,
        'password': password,
        'name': name,
        'role': role,
        'phone': generateRandom20DigitNumber(),
      };

      final response = await _orbApiClient.post<Map<String, dynamic>>(
        'api/v1/auth/signup',
        data: request,
      );

      log('');

      return '';
    } on DioException catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }

  ///
  int generateRandom20DigitNumber() {
    final random = Random();
    // Generate 20 random digits and concatenate them into a string
    var randomNumber = '';
    for (var i = 0; i < 10; i++) {
      randomNumber += random.nextInt(10).toString();
    }
    return int.parse(randomNumber);
  }

  /// Login user with providing email,password,name,phone,role.
  Future<String?> login({
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

      log('[UserResource] login response: ${response.data}');

      final data = response.data;
      if (data != null) {
        return data['access_token'] as String;
      }
      return null;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }
}

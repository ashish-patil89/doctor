// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:storage/storage.dart';
import 'package:user_repository/src/failure.dart';
import 'package:user_repository/user_repository.dart';

/// Storage keys for [TokenStorage].
abstract class TokenStorageKeys {
  /// The storage key for a [Token].
  static const token = '__token_key__';
}

/// {@template feed_repository}
/// A repository for managing feed.
/// {@endtemplate}
class UserRepository {
  /// {@macro feed_repository}
  UserRepository({
    required ApiClient apiClient,
    required Storage storage,
  })  : _apiClient = apiClient,
        _storage = storage;

  final ApiClient _apiClient;
  final Storage _storage;

  /// To check the access token in there in storage.
  Future<String?> getAccessToken() async {
    try {
      return _storage.read(
        key: TokenStorageKeys.token,
      );
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }

  /// Login user with [email , password]
  Future<String> signup({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final success = await _apiClient.user.signup(
        email: email,
        password: password,
        name: name,
        role: role,
      );

      return success;
    } catch (error, stackTrace) {
      final e = error as ApiInvalidResponseFailure;
      if (e.body != null) {
        // Parse the response data
        final data = e.body!;
        final errors = data['error'];
        if (errors is String) {
          final message = data['message'] as String;
          Error.throwWithStackTrace(
            SignupFailedFailure(message),
            stackTrace,
          );
        }
        if (errors is List) {
          for (final error in errors) {
            final key = error['key'][0];
            final errorMessage = error['error'] as String;
            if (key == 'email') {
              Error.throwWithStackTrace(
                EmailFailedFailure(errorMessage),
                stackTrace,
              );
            }
            if (key == 'phone') {
              Error.throwWithStackTrace(
                PhoneFailedFailure(errorMessage),
                stackTrace,
              );
            }
            if (key == 'password') {
              Error.throwWithStackTrace(
                PasswordFailedFailure(errorMessage),
                stackTrace,
              );
            }
            log('Error Key: $key, Message: $errorMessage');
          }
        }
      }
      return '';
    }
  }

  /// Login user with [email , password]
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _apiClient.user.login(
        email: email,
        password: password,
      );

      await _storage.write(
        key: TokenStorageKeys.token,
        value: json.encode(token),
      );
      return token;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }
}

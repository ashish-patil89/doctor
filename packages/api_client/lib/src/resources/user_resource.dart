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

  /// Gets available communities for the given [memberOnly],
  /// [limit], [cursor], and [thumbnailDimension].
  ///
  /// {@macro api_error_handling}
  Future<bool> getUsers() async {
    try {
      final response = await _orbApiClient.get<Map<String, dynamic>>(
        'users',
      );

      log('[CommunityResource] getCommunities response: ${response.data}');

      return true;
    } catch (error, stackTrace) {
      handleApiError(error, stackTrace);
    }
  }
}

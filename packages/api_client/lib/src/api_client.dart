import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';

/// {@template api_client}
/// A client for the Orb API.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    required String orbOriginUrl,
    required String orbUploadUrl,
    required String orbApiBaseUrl,
    required String orbAccessToken,
    required String appVersion,
    Dio? orbApiClient,
  })  : _orbOriginUrl = orbOriginUrl,
        _orbUploadUrl = orbUploadUrl,
        _orbApiClient = orbApiClient ??
            Dio(
              BaseOptions(
                baseUrl: orbApiBaseUrl,
                headers: {
                  HttpHeaders.contentTypeHeader: ContentType.json.value,
                  OrbHttpHeaders.orbAccessTokenHeader: 'Bearer $orbAccessToken',
                  OrbHttpHeaders.orbAppVersionHeader: appVersion,
                },
              ),
            )
          ..useNativeDioAdapterOnIOS();

  final String _orbOriginUrl;
  final String _orbUploadUrl;

  final Dio _orbApiClient;

  /// The resource for interacting with the Config API.
  late final config = UserResource(
    orbApiClient: _orbApiClient,
  );
}

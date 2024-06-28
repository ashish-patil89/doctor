// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('ApiClient', () {
    test('can be instantiated', () {
      final client = ApiClient(
        orbOriginUrl: 'https://example.com',
        orbUploadUrl: 'https://example.com',
        orbApiBaseUrl: 'https://example.com',
        orbAccessToken: 'orbAccessToken',
        appVersion: '1.0.0',
      );

      expect(
        client,
        isNotNull,
      );
    });
  });
}

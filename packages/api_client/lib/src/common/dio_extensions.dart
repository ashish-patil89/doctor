import 'package:dio/dio.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:platform/platform.dart';

/// Extensions on the Dio class.
extension DioExtensions on Dio {
  /// Updates Dio to use the native HTTP adapter on iOS.
  ///
  /// We're currently only using it for iOS to resolve frequent
  /// [bad file descriptor errors](https://github.com/dart-lang/http/issues/197).
  ///
  /// On iOS this uses [cupertino_http](https://pub.dev/packages/cupertino_http)
  /// to make HTTP requests.
  ///
  /// Android's `cronet_http` library is not yet ready for production use.
  /// See issues such as https://github.com/dart-lang/http/issues/1179 and
  /// https://github.com/cfug/dio/issues/2116.
  ///
  /// Using the native platform implementation, rather than the socket-based
  /// dart:io HttpClient implementation, has several advantages:
  ///
  /// - It automatically supports platform features such VPNs and HTTP proxies.
  /// - It supports many more configuration options such as only allowing access
  ///   through WiFi and blocking cookies.
  /// - It supports more HTTP features such as HTTP/3 and custom redirect handling.
  void useNativeDioAdapterOnIOS({
    LocalPlatform platform = const LocalPlatform(),
  }) {
    if (platform.isIOS) {
      httpClientAdapter = NativeAdapter();
    }
  }
}

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// {@template api_invalid_response_failure}
/// Thrown when the API response is invalid.
/// {@endtemplate}
class ApiInvalidResponseFailure extends Equatable implements Exception {
  /// {@macro api_invalid_response_failure}
  const ApiInvalidResponseFailure({
    required this.statusCode,
    required this.body,
    this.data,
  });

  /// The associated HTTP status code, if available.
  final int? statusCode;

  /// The associated response body, if available.
  final Map<String, dynamic>? body;

  /// The associated data, if available.
  final String? data;

  @override
  List<Object?> get props => [statusCode, body, data];
}

/// {@template api_request_timeout_failure}
/// Thrown when a timeout occurs during a request.
/// {@endtemplate}
class ApiRequestTimeoutFailure extends Equatable implements Exception {
  /// {@macro api_request_timeout_failure}
  const ApiRequestTimeoutFailure({
    required this.error,
  });

  /// The associated error.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// {@template api_request_network_failure}
/// Thrown when a network error occurs during a request.
/// {@endtemplate}
class ApiRequestNetworkFailure extends Equatable implements Exception {
  /// {@macro api_request_network_failure}
  const ApiRequestNetworkFailure({
    required this.error,
  });

  /// The associated error.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// {@template api_request_failure}
/// Thrown when an error occurs during a request.
/// {@endtemplate}
class ApiRequestFailure extends Equatable implements Exception {
  /// {@macro api_request_failure}
  const ApiRequestFailure({
    required this.error,
  });

  /// The associated error.
  final Object error;

  /// The associated error reason.
  String get errorReason {
    final error = this.error;
    if (error is ResourceException) {
      return error.response?.message ?? error.error.toString();
    } else if (error is DioException) {
      return error.type.toPrettyDescription();
    }
    return error.toString();
  }

  @override
  List<Object> get props => [error];
}

extension _DioExceptionTypeExtension on DioExceptionType {
  String toPrettyDescription() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return 'Bad response';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error';
      case DioExceptionType.unknown:
        return 'Unknown error';
    }
  }
}

/// {@template api_error_handling}
/// Handles API errors by throwing:
/// - [ApiInvalidResponseFailure] if the response is invalid.
/// - [ApiRequestTimeoutFailure] if the request timed out.
/// - [ApiRequestNetworkFailure] if the request failed due to a network error.
/// - [ApiRequestFailure] if the request failed for any other reason.
/// {@endtemplate}
Never handleApiError(Object error, StackTrace stackTrace) {
  // Handle Dio errors.
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        Error.throwWithStackTrace(
          ApiRequestTimeoutFailure(error: error),
          stackTrace,
        );
      case DioExceptionType.badResponse:
        final responseErrorData = error.response?.data;
        final responseError = ApiInvalidResponseFailure(
          body: responseErrorData is Map<String, dynamic>?
              ? responseErrorData
              : null,
          data: responseErrorData is String ? responseErrorData : null,
          statusCode: error.response?.statusCode,
        );
        Error.throwWithStackTrace(responseError, stackTrace);
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        Error.throwWithStackTrace(
          ApiRequestFailure(error: error),
          stackTrace,
        );
    }
  }

  // Handle unknown errors.
  Error.throwWithStackTrace(
    ApiRequestFailure(error: error),
    stackTrace,
  );
}

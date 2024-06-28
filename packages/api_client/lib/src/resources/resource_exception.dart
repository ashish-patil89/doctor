import 'package:api_client/api_client.dart';
import 'package:api_models/api_models.dart';
import 'package:equatable/equatable.dart';

/// {@template resource_exception}
/// Thrown when an error occurs during a request in the resource.
///
/// This exception should be thrown inside of the try block of resource methods.
/// It will be mapped to an [ApiRequestFailure] in [handleApiError] with an
/// appropriate error reason based on the [response].
/// {@endtemplate}
class ResourceException extends Equatable implements Exception {
  /// {@macro resource_exception}
  const ResourceException(
    this.error, {
    this.response,
  });

  /// The associated error.
  final Object error;

  /// The associated response, if available.
  final ApiResponse? response;

  @override
  List<Object?> get props => [error, response];
}

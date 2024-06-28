import 'package:json_annotation/json_annotation.dart';

/// {@template status_converter}
/// A converter from `SUCCESS`/`FAILURE` values to `true`/`false`.
/// {@endtemplate}
class StatusConverter implements JsonConverter<bool, String> {
  /// {@macro status_converter}
  const StatusConverter();

  @override
  bool fromJson(String status) {
    return status == 'SUCCESS';
  }

  @override
  String toJson(bool isSuccess) => isSuccess ? 'SUCCESS' : 'FAILURE';
}

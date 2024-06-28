import 'package:api_models/src/common/status_converter.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// {@template get_api_response}
/// A default response of any post api.
/// {@endtemplate}
@JsonSerializable()
class ApiResponse extends Equatable {
  /// {@macro get_api_response}
  const ApiResponse({
    required this.isSuccess,
    this.message,
  });

  /// Converts a [Map] into a [ApiResponse].
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  /// Converts this [ApiResponse] into a [Map].
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  /// Whether the request was successful.
  @StatusConverter()
  @JsonKey(name: 'status')
  final bool isSuccess;

  /// The message.
  @JsonKey(name: 'msg')
  final String? message;

  @override
  List<Object?> get props => [
        isSuccess,
        message,
      ];
}

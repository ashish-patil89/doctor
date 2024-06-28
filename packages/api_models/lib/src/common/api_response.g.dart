// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map json) => $checkedCreate(
      'ApiResponse',
      json,
      ($checkedConvert) {
        final val = ApiResponse(
          isSuccess: $checkedConvert(
              'status', (v) => const StatusConverter().fromJson(v as String)),
          message: $checkedConvert('msg', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'isSuccess': 'status', 'message': 'msg'},
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'status': const StatusConverter().toJson(instance.isSuccess),
      'msg': instance.message,
    };

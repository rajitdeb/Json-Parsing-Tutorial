// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiUserResponse _$MultiUserResponseFromJson(Map<String, dynamic> json) =>
    MultiUserResponse(
      (json['page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => CUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MultiUserResponseToJson(MultiUserResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'data': instance.users,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CUser _$CUserFromJson(Map<String, dynamic> json) => CUser(
      (json['id'] as num).toInt(),
      json['email'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$CUserToJson(CUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };

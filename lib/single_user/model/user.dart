import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class CUser {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  @JsonKey(name: "avatar")
  final String avatar;

  CUser(this.id, this.email, this.firstName, this.lastName, this.avatar);

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory CUser.fromJson(Map<String, dynamic> json) => _$CUserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CUserToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:json_parsing_tutorial/single_user/model/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "data")
  final CUser user;
  UserResponse(this.user);

  /// Connect the generated [_$UserResponseFromJson] function to the `fromJson`
  /// factory.
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  /// Connect the generated [_$UserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

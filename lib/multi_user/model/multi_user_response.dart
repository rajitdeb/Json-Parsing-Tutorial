import 'package:json_annotation/json_annotation.dart';
import 'package:json_parsing_tutorial/single_user/model/user.dart';

part 'multi_user_response.g.dart';

@JsonSerializable()
class MultiUserResponse {
  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "data")
  final List<CUser> users;

  MultiUserResponse(this.page, this.users);

  /// Connect the generated [_$MultiUserResponseFromJson] function to the `fromJson`
  /// factory.
  factory MultiUserResponse.fromJson(Map<String, dynamic> json) =>
      _$MultiUserResponseFromJson(json);

  /// Connect the generated [_$MultiUserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MultiUserResponseToJson(this);
}

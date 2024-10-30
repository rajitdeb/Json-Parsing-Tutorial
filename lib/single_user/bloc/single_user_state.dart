import 'package:json_parsing_tutorial/single_user/model/user.dart';

abstract class SingleUserState {}

class SingleUserLoading extends SingleUserState {}

class SingleUserLoaded extends SingleUserState {
  final CUser user;

  SingleUserLoaded(this.user);
}

class SingleUserError extends SingleUserState {
  final String errorMsg;

  SingleUserError(this.errorMsg);
}

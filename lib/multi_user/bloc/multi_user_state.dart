import '../../single_user/model/user.dart';

abstract class MultiUserState {}

class MultiUserLoading extends MultiUserState {}

class MultiUserLoaded extends MultiUserState {
  final List<CUser> user;

  MultiUserLoaded(this.user);
}

class MultiUserError extends MultiUserState {
  final String errorMsg;

  MultiUserError(this.errorMsg);
}

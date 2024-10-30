import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_event.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_state.dart';
import 'package:logger/logger.dart';

import '../model/multi_user_response.dart';

class MultiUserBloc extends Bloc<MultiUserEvent, MultiUserState> {
  // Logging Service
  final Logger _logger = Logger();

  MultiUserBloc(httpService) : super(MultiUserLoading()) {
    on<MultiUserFetch>((event, emit) async {
      // Emit Loading State
      emit(MultiUserLoading());

      try {
        final rawResp = await httpService.getRequest("api/users?page=1");

        final userListResp = MultiUserResponse.fromJson(rawResp.data);
        final userList = userListResp.users;

        _logger.i(userList[0].toJson());

        emit(MultiUserLoaded(userList));
      } catch (e) {
        emit(MultiUserError("Failed to fetch data: $e"));
      }
    });
  }
}

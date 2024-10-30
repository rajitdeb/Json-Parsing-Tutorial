import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_event.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_state.dart';
import 'package:logger/logger.dart';

import '../model/user_response.dart';

class SingleUserBloc extends Bloc<SingleUserEvent, SingleUserState> {
  // Logging Service
  final Logger _logger = Logger();

  SingleUserBloc(httpService) : super(SingleUserLoading()) {
    on<SingleUserFetch>((event, emit) async {
      // Emit Loading State
      emit(SingleUserLoading());

      try {
        final rawResp = await httpService.getRequest("api/users/2");

        final singleUserResp = UserResponse.fromJson(rawResp.data);
        final currentUser = singleUserResp.user;

        // _logger.i("Converted Data: ${singleUserResp.user.toJson()}");

        emit(SingleUserLoaded(currentUser));
      } catch (e) {
        emit(SingleUserError("Failed to fetch data $e"));
      }
    });
  }
}

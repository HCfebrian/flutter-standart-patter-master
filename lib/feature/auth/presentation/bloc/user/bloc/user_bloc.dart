import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SharedPreferences sharedPreferences;

  UserBloc({required this.sharedPreferences}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserLoggedOutEvent) {
      yield UserLoadingState();
      sharedPreferences.setString("addToken", "");
      yield UserLoggedOutState();
    }
    if(event is UserLoggedInEvent){
      yield UserLoadingState();
      yield UserLoggedInState();
    }
  }
}

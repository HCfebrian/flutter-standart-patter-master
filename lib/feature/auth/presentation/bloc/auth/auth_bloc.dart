import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_flutter/feature/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authUsecase;

  AuthBloc({
    required this.authUsecase,
  }) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoginEvent) {
      yield AuthLoadingState();
      try {
        authUsecase.registerUser(
          email: event.email,
          password: event.password,
        );
        yield AuthSuccessState();
      } catch (e) {
        yield AuthErrorState(
          message: e.toString(),
        );
      }
    }
    if (event is AuthRegisterEvent) {
      yield AuthLoadingState();

      try {
        if (event.password != event.rePassword) {
          throw Exception("password confirmation failed");
        }
        authUsecase.registerUser(
          email: event.email,
          password: event.password,
        );
        yield AuthSuccessState();
      } catch (e) {
        yield AuthErrorState(
          message: e.toString(),
        );
      }
    }
  }
}

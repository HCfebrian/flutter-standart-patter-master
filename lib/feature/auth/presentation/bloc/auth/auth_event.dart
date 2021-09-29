part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String rePassword;

  const AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.rePassword,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        rePassword,
      ];
}

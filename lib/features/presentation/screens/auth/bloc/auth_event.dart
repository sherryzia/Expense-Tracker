import 'package:equatable/equatable.dart';

/// Events consumed by [AuthBloc].
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested();
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested();
}

class AuthForgotPasswordRequested extends AuthEvent {
  const AuthForgotPasswordRequested();
}

class AuthActionConsumed extends AuthEvent {
  const AuthActionConsumed();
}
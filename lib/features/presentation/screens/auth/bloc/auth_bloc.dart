import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

/// Transient action dispatcher for the landing screen.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthLoginRequested>(
      (event, emit) => emit(state.copyWith(action: AuthAction.login)),
    );
    on<AuthSignUpRequested>(
      (event, emit) => emit(state.copyWith(action: AuthAction.signUp)),
    );
    on<AuthForgotPasswordRequested>(
      (event, emit) => emit(state.copyWith(action: AuthAction.forgotPassword)),
    );
    on<AuthActionConsumed>(
      (event, emit) => emit(state.copyWith(action: AuthAction.none)),
    );
  }
}
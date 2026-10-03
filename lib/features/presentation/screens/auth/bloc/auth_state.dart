import 'package:equatable/equatable.dart';

/// Actions the landing buttons can trigger.
enum AuthAction { none, login, signUp, forgotPassword }

/// UI state of the landing screen.
class AuthState extends Equatable {
  const AuthState({this.action = AuthAction.none});

  final AuthAction action;

  AuthState copyWith({AuthAction? action}) {
    return AuthState(action: action ?? this.action);
  }

  @override
  List<Object?> get props => [action];
}
import 'package:equatable/equatable.dart';

/// Generic async/load status shared by bloc states.
enum Status { idle, loading, success, failure }

/// Value class pairs a failure [Status] with a user-facing message.
class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
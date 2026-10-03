import 'package:equatable/equatable.dart';

/// Events consumed by [HomeBloc].
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Requests the initial load of the home feed.
class HomeLoadRequested extends HomeEvent {
  const HomeLoadRequested();
}
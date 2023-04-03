part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final bool status;

  UserSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class UserFailed extends UserState {
  final String error;

  UserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

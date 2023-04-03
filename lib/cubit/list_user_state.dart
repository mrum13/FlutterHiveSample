part of 'list_user_cubit.dart';

abstract class ListUserState extends Equatable {
  const ListUserState();

  @override
  List<Object> get props => [];
}

class ListUserInitial extends ListUserState {}

class ListUserLoading extends ListUserState {}

class ListUserSuccess extends ListUserState {
  final bool status;

  ListUserSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class ListUserFailed extends ListUserState {
  final String error;

  ListUserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

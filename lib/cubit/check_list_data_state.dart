part of 'check_list_data_cubit.dart';

abstract class CheckListDataState extends Equatable {
  const CheckListDataState();

  @override
  List<Object> get props => [];
}

class CheckListDataInitial extends CheckListDataState {}

class CheckListDataLoading extends CheckListDataState {}

class CheckListDataSuccess extends CheckListDataState {
  final String status;

  CheckListDataSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckListDataFailed extends CheckListDataState {
  final String error;

  CheckListDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

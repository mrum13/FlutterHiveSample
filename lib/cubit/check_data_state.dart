part of 'check_data_cubit.dart';

abstract class CheckDataState extends Equatable {
  const CheckDataState();

  @override
  List<Object> get props => [];
}

class CheckDataInitial extends CheckDataState {}

class CheckDataLoading extends CheckDataState {}

class CheckDataSuccess extends CheckDataState {
  final String status;

  CheckDataSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckDataFailed extends CheckDataState {
  final String error;

  CheckDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

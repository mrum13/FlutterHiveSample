part of 'clear_data_cubit.dart';

abstract class ClearDataState extends Equatable {
  const ClearDataState();

  @override
  List<Object> get props => [];
}

class ClearDataInitial extends ClearDataState {}

class ClearDataLoading extends ClearDataState {}

class ClearDataSuccess extends ClearDataState {
  final bool status;

  ClearDataSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class ClearDataFailed extends ClearDataState {
  final String error;

  ClearDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

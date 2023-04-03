import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_sample/services/user_services.dart';

part 'clear_data_state.dart';

class ClearDataCubit extends Cubit<ClearDataState> {
  ClearDataCubit() : super(ClearDataInitial());

  void clearDataInHive() async {
    try {
      emit(ClearDataLoading());

      bool status = await UserServices().clearDataInHive();

      emit(ClearDataSuccess(status));
    } catch (e) {
      emit(ClearDataFailed(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_sample/services/user_services.dart';

part 'check_data_state.dart';

class CheckDataCubit extends Cubit<CheckDataState> {
  CheckDataCubit() : super(CheckDataInitial());

  void checkDataInHive() async {
    try {
      emit(CheckDataLoading());

      String status = await UserServices().checkSingleData();

      emit(CheckDataSuccess(status));
    } catch (e) {
      emit(CheckDataFailed(e.toString()));
    }
  }
}

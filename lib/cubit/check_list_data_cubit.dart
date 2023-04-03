import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_sample/services/user_services.dart';

part 'check_list_data_state.dart';

class CheckListDataCubit extends Cubit<CheckListDataState> {
  CheckListDataCubit() : super(CheckListDataInitial());

  void checkListDataInHive() async {
    try {
      emit(CheckListDataLoading());

      String status = await UserServices().checkListData();

      emit(CheckListDataSuccess(status));
    } catch (e) {
      emit(CheckListDataFailed(e.toString()));
    }
  }
}

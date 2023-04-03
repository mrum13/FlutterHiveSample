import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_sample/services/user_services.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit() : super(ListUserInitial());

  void getListUser() async {
    try {
      emit(ListUserLoading());

      bool status = await UserServices().getListUser();

      emit(ListUserSuccess(status));
    } catch (e) {
      emit(ListUserFailed(e.toString()));
    }
  }
}

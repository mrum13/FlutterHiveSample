import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/models/user.dart';
import 'package:hive_sample/services/user_services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUser() async {
    try {
      emit(UserLoading());

      bool status = await UserServices().getUser();

      emit(UserSuccess(status));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }
}

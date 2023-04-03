import 'package:flutter/material.dart';
import 'package:hive_sample/cubit/check_data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_sample/cubit/check_list_data_cubit.dart';
import 'package:hive_sample/cubit/clear_data_cubit.dart';
import 'package:hive_sample/cubit/list_user_cubit.dart';
import 'package:hive_sample/cubit/user_cubit.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CheckDataCubit>().checkDataInHive();
                          Navigator.pushNamed(context, "show-data");
                        },
                        child: const Text("Show Data From Local")),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<CheckListDataCubit>()
                              .checkListDataInHive();
                          Navigator.pushNamed(context, "show-list-data");
                        },
                        child: const Text("Show List Data From Local")),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocConsumer<UserCubit, UserState>(
                      listener: (context, state) {
                        if (state is UserSuccess) {
                          if (state.status) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Data Berhasil Didapat!")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Data Gagal Didapat!")));
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () {
                              context.read<UserCubit>().getUser();
                            },
                            child: const Text("Get Single Data From Api"));
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocConsumer<ListUserCubit, ListUserState>(
                      listener: (context, state) {
                        if (state is ListUserSuccess) {
                          if (state.status) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content:
                                        Text("List Data Berhasil Didapat!")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("List Data Gagal Didapat!")));
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is ListUserLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () {
                              context.read<ListUserCubit>().getListUser();
                            },
                            child: const Text("Get List Data From Api"));
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocListener<ClearDataCubit, ClearDataState>(
                      listener: (context, state) {
                        if (state is ClearDataSuccess) {
                          if (state.status) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Data Berhasil Dihapus!")));
                          }
                        }
                      },
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<ClearDataCubit>().clearDataInHive();
                          },
                          child: const Text("Clear Data in Local")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

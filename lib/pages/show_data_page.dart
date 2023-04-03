import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_sample/cubit/check_data_cubit.dart';
import 'package:hive_sample/main.dart';
import 'package:hive_sample/models/user.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<CheckDataCubit, CheckDataState>(
            builder: (context, state) {
              if (state is CheckDataSuccess) {
                if (state.status == "Data Exist") {
                  User user = singleDataBox.get("user");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.firstName),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(user.lastName),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(user.email),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(state.status),
                  );
                }
              } else if (state is CheckDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Ada Kesalahan !"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

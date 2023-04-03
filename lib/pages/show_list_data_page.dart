import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_sample/cubit/check_list_data_cubit.dart';
import 'package:hive_sample/main.dart';
import 'package:hive_sample/models/list_user.dart';

class ShowListDataPage extends StatelessWidget {
  const ShowListDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<CheckListDataCubit, CheckListDataState>(
            builder: (context, state) {
              if (state is CheckListDataSuccess) {
                if (state.status == "Data Exist") {
                  List listUser = [];
                  var myMap = listDataBox.toMap().values.toList();

                  listUser = myMap;
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.amber),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listUser[index]["first_name"]),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(listUser[index]["last_name"]),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(listUser[index]["email"]),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: listUser.length);
                } else {
                  return Center(
                    child: Text(state.status),
                  );
                }
              } else if (state is CheckListDataLoading) {
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

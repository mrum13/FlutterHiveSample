import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/cubit/check_data_cubit.dart';
import 'package:hive_sample/cubit/check_list_data_cubit.dart';
import 'package:hive_sample/cubit/clear_data_cubit.dart';
import 'package:hive_sample/cubit/list_user_cubit.dart';
import 'package:hive_sample/cubit/user_cubit.dart';
import 'package:hive_sample/models/user.dart';
import 'package:hive_sample/pages/show_data_page.dart';
import 'package:hive_sample/pages/init_page.dart';
import 'package:hive_sample/pages/show_list_data_page.dart';

late Box singleDataBox;
late Box listDataBox;

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  singleDataBox = await Hive.openBox("singleDataBox");
  listDataBox = await Hive.openBox("listDataBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => UserCubit())),
        BlocProvider(create: ((context) => ListUserCubit())),
        BlocProvider(create: ((context) => CheckDataCubit())),
        BlocProvider(create: ((context) => CheckListDataCubit())),
        BlocProvider(create: ((context) => ClearDataCubit())),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const InitPage(),
          'show-data': (context) => const ShowDataPage(),
          'show-list-data': (context) => const ShowListDataPage(),
        },
      ),
    );
  }
}

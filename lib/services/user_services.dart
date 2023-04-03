import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_sample/models/user.dart';
import 'package:hive_sample/main.dart';

import 'base_url.dart' as base_url;
import 'package:http/http.dart' as http;

class UserServices {
  List data = [];

  Future<bool> getUser() async {
    var url = '${base_url.Url}/users/2';
    var header = {
      'Accept': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body)['data'];

    try {
      putSingleDataToHive(data);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getListUser() async {
    var url = '${base_url.Url}/users?page=2';
    var header = {
      'Accept': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body)['data'];

    try {
      putListDataToHive(data);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Box> putListDataToHive(data) async {
    await listDataBox.clear();

    for (var d in data) {
      listDataBox.add(d);
    }

    return listDataBox;
  }

  Future<Box> putSingleDataToHive(data) async {
    await singleDataBox.clear();

    singleDataBox.put(
        "user",
        User(
            id: data['id'],
            email: data['email'],
            firstName: data['first_name'],
            lastName: data['last_name'],
            avatar: data['avatar']));

    return singleDataBox;
  }

  Future<String> checkSingleData() async {
    var myData = singleDataBox.values;
    if (myData.isEmpty) {
      return "Empty";
    } else {
      return "Data Exist";
    }
  }

  Future<String> checkListData() async {
    var myData = listDataBox.values;
    if (myData.isEmpty) {
      return "Empty";
    } else {
      return "Data Exist";
    }
  }

  Future<bool> clearDataInHive() async {
    await singleDataBox.clear();
    await listDataBox.clear();

    return true;
  }
}

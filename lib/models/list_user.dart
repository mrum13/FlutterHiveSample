import 'package:hive/hive.dart';

part 'list_user.g.dart';

@HiveType(typeId: 1)
class ListUser {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String avatar;

  ListUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}

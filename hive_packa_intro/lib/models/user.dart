import 'package:hive/hive.dart';


part 'user.g.dart';  // Ensure this line is present


@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  User({required this.name});
}

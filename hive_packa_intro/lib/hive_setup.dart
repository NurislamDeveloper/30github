import 'package:hive_flutter/hive_flutter.dart';
import 'models/user.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter()); // Now it should work
  await Hive.openBox<User>('userBox');
}

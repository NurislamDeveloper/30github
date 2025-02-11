// services/hive_service.dart
import 'package:hive/hive.dart';
import '../models/user.dart';

class HiveService {
  final Box<User> userBox = Hive.box<User>('userBox');

  void saveUser(String name) {
    userBox.put('user', User(name: name));
  }

  User? getUser() {
    return userBox.get('user');
  }
}
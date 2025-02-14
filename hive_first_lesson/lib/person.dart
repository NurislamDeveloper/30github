import 'package:hive/hive.dart';

part 'person.g.dart'; // Generated file for Hive

@HiveType(typeId: 1) // Ensure this is unique and consistent
class Person {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;



  Person({
    required this.name,
    required this.age,
 
  });
}
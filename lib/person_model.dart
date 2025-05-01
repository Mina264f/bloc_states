

import 'package:hive/hive.dart';
part 'person_model.g.dart';

@HiveType(typeId: 0)
class Person
{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String job;
  @HiveField(2)
  final String image;
  Person({required this.name,required this.job,required this.image});
}
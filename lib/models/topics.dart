import 'package:uuid/uuid.dart';

enum DisciplineType { math, algebra, geometry }

class Discipline {
  Discipline({
    required this.type,
    required this.title,
    required this.topics,
  });
  final DisciplineType type;
  final String title;
  final List<Topic> topics;
}

class SchoolClass {
  SchoolClass({
    required this.clasNumber,
    required this.disciplines,
  });
  final int clasNumber;
  final List<Discipline> disciplines;
}

class Topic {
  Topic({required this.title, String? id}) : id = id ?? Uuid().v4();
  final String id;
  final String title;
}

import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Topics { algebra, geometry, math }

class Topic {
  Topic({
    required this.title,
    required this.topic,
    this.clas = 0,
    String? id,
  }) : id = id ?? uuid.v4();
  final String id;
  final String title;
  final Topics topic;
  final int clas;
}

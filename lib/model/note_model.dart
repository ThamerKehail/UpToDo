import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveType(typeId: 0)
  final String title;
  @HiveType(typeId: 1)
  final String description;
  @HiveType(typeId: 2)
  final String date;
  @HiveType(typeId: 3)
  final String time;
  @HiveType(typeId: 4)
  final String category;
  @HiveType(typeId: 5)
  final int priority;

  NoteModel({
    required this.title,
    required this.date,
    required this.time,
    required this.category,
    required this.description,
    required this.priority,
  });
}

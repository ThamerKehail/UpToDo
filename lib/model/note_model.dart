import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String category;
  @HiveField(5)
  int priority;
  @HiveField(6)
  int catColor;

  NoteModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
    required this.priority,
    required this.catColor,
  });
}

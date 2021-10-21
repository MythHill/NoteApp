import 'package:hive/hive.dart';

part 'NotesModel.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late DateTime createdDate;
  @HiveField(2)
  late String note;
  @HiveField(3)
  late String tags;
  @HiveField(4)
  late String author;

  NotesModel(this.title, this.note, this.tags, this.author, this.createdDate);
  }
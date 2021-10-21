import 'package:hive/hive.dart';

import 'helper/NotesModel.dart';
class Boxes {
  static Box<NotesModel> getNotesBox() => Hive.box("NotesBox");
}
import 'NotesModel.dart';
import 'package:notes/Boxes.dart';

class DataBaseFuncs{
  //Add note
  Future addNote(String note, String author, String title, String tags)async{
    final createdDate = DateTime.now();
    final noteModel = NotesModel(title, note, author, tags, createdDate);

    final box = Boxes.getNotesBox();
    box.add(noteModel);

  }
  updateNote(String note, String title, String tags, String author, NotesModel notesModel){
    notesModel.title = title;
    notesModel.author = author;
    notesModel.tags = tags;
    notesModel.note = note;

    notesModel.save();
  }
  deleteNote(NotesModel notesModel){
    notesModel.delete();
  }
  }
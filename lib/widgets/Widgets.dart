import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/ViewNote.dart';
import 'package:notes/helper/DataBaseFuncs.dart';
import 'package:notes/helper/NotesModel.dart';

Widget buildContent(List<NotesModel> notesModel, DataBaseFuncs db){
  return Column(children: [
    notesModel.length > 0
    ? Expanded(child: 
    ListView.builder(
      itemCount: notesModel.length,
      itemBuilder: (BuildContext context, int index){
        final notes = notesModel[index];
        return buildNotesTile(context, db, notes);

      },
      ),
      )
      : Column()
  ],);
}

Widget buildNotesTile(
  BuildContext context, DataBaseFuncs db, NotesModel notes){
    final date = DateFormat.yMMMd().format(notes.createdDate);
    return Card(child: ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNote(note: notes, db: db)));
      },
      title: Text('Notes'),
      subtitle: Text(notes.tags + "," + date),
      trailing: IconButton(icon: Icon(Icons.delete),
      onPressed: (){
        db.deleteNote(notes);
      },),
    ),);
  }
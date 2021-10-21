import 'package:flutter/material.dart';
import 'package:notes/EditNote.dart';
import 'package:notes/helper/DataBaseFuncs.dart';
import 'package:notes/helper/NotesModel.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({ Key? key,  required this.note, required this.db}) : super(key: key);

  final NotesModel note;
  final DataBaseFuncs db;

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(note: widget.note, db: widget.db,)));
        }, child: Icon(Icons.edit),),


        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.note.title,style: TextStyle(fontSize: 45, color: Colors.black87, fontWeight: FontWeight.bold ),),
              SizedBox(height: 30,),
              Text(widget.note.note,style: TextStyle(fontSize: 23, color: Colors.grey, ),),
            ],
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:notes/helper/DataBaseFuncs.dart';
import 'package:notes/helper/NotesModel.dart';

class EditNote extends StatefulWidget {
  const EditNote({ Key? key, required this.note, required this.db }) : super(key: key);

  final NotesModel note;
  final DataBaseFuncs db;

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  TextEditingController titleControler = TextEditingController();
  TextEditingController NoteControler = TextEditingController();
  TextEditingController TagControler = TextEditingController();
  TextEditingController AuthorControler = TextEditingController();

  editnote(){
    if ( titleControler.text != null &&
    NoteControler.text != null &&
    TagControler != null &&
    AuthorControler.text != null){
      widget.db.updateNote(widget.note.note, widget.note.title, widget.note.tags, widget.note.author, widget.note);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
      Text('Please fill all fields')));
    }
  }
  @override
  void initState() {
    titleControler.text = widget.note.title;
    TagControler.text = widget.note.tags;
    AuthorControler.text = widget.note.author;
    NoteControler.text = widget.note.note;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        ),
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
            child: Column(
              children: [
                TextField(
                  controller: titleControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Title",
        
                  ),),
                  SizedBox(height: 20,),
                  TextField(
                  controller: NoteControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Write a note...",
        
                  ),),
                  SizedBox(height: 20,),
                  TextField(
                  controller: TagControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Tags",
        
                  ),),
                  SizedBox(height: 20,),
                  TextField(
                  controller: AuthorControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Author",
        
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text ("Cancel") ),
                    SizedBox(width: 120,),
                    ElevatedButton(onPressed: editnote, child: Text ("Update"))
                  ],)
              ],
            ),
          ),
        ),


        );
  }
}
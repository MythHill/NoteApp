import 'package:flutter/material.dart';
import 'package:notes/helper/DataBaseFuncs.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({ Key? key }) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  TextEditingController titleControler = TextEditingController();
  TextEditingController NoteControler = TextEditingController();
  TextEditingController TagControler = TextEditingController();
  TextEditingController AuthorControler = TextEditingController();

  DataBaseFuncs db = DataBaseFuncs();

  SaveNotes(){
    db.addNote(NoteControler.text, AuthorControler.text, titleControler.text, TagControler.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
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
                    ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                    }, child: Text ("Cancel") ),
                    SizedBox(width: 120,),
                    ElevatedButton(onPressed: SaveNotes, child: Text ("Save"))
                  ],)
              ],
            ),
          ),
        ),


        );
  }
}
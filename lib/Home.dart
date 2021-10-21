import 'package:flutter/material.dart';
import 'package:notes/CreateNote.dart';
import 'package:notes/ViewNote.dart';
import 'package:notes/helper/DataBaseFuncs.dart';
import 'package:notes/helper/NotesModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Boxes.dart';
import 'package:notes/widgets/Widgets.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataBaseFuncs db = DataBaseFuncs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote()));
        }, child: Icon(Icons.add),),

        body: ValueListenableBuilder<Box<NotesModel>>(
          valueListenable: Boxes.getNotesBox().listenable(),
          builder: (context, box, _){
            final notes = box.values.toList().cast<NotesModel>();
            return buildContent(notes, db);
          },)
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/notes_data.dart';
class AddNote extends StatefulWidget {

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String newTask = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (Task){
                  newTask = Task;
                  //tasks.append[task('$value')];
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.cyan, width: 3.0),
                    ),
                    labelText: "Add your task"
                ),
              //  autofocus: true,
                textAlign: TextAlign.center,
                showCursor: true,
                enableSuggestions: true,
                cursorColor: Colors.cyan,
                textCapitalization: TextCapitalization.sentences,
                cursorHeight: 30,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Provider.of<NotesData>(context,listen: false).add(newTask);
                    print("New task added");
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      ),
    );
  }
}

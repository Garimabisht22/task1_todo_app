import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/notes_data.dart';

class TasksListWidget extends StatefulWidget {
  final int index;
  TasksListWidget({required this.index});

  @override
  _TasksListWidgetState createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {

    //final Notes = Provider.of<NotesData>(context).getNotesList()[widget.index];

    return Consumer<NotesData>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shadowColor: Colors.black,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Checkbox(
                  side: BorderSide(
                      color: Colors.tealAccent,
                      width: 2.5
                  ),
                  checkColor: Colors.blue,
                  value: isChanged,
                  onChanged: (value) {
                    setState(() {
                      isChanged = value!;
                    });
                  },
                  activeColor: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(data.getNotesList()[widget.index], style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: isChanged
                        ? TextDecoration.lineThrough
                        : TextDecoration.none
                ),),
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}

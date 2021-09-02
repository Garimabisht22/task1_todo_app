import 'package:flutter/cupertino.dart';

class NotesData extends ChangeNotifier{

  List<String> _notesList = [
    "Pickup Friend",
    "DEMO DATA"
  ];

  List<String> getNotesList(){
    return _notesList;
  }

  void add(String note){
    print("Task Added : "+note);
     _notesList.add(note);
    notifyListeners();
  }
  void removeTask(int index){
     _notesList.removeAt(index);
  }
}
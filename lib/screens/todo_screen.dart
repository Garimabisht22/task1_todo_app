import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/widgets/add_note.dart';
import 'package:to_do/modules/notes_data.dart';
import 'package:to_do/widgets/dismissible_widget.dart';
import 'package:to_do/widgets/tasks_list_widget.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<NotesData>(
        builder: (BuildContext context, data, Widget? child) {
          return Stack(
            children: [
              Container(
                  margin: EdgeInsets.all(4),
                  // color: Colors.grey,
                  child: ListView.builder(
                      itemCount: data
                          .getNotesList()
                          .length,
                      itemBuilder: (BuildContext, index) {
                        return DismissibleWidget(
                          onDismissed: (Direction){
                            setState(() {
                              data.removeTask(index);
                            });
                          },
                          item: data.getNotesList()[index],
                          child: TasksListWidget(
                            index: index,
                          ),
                        );
                      })

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    //   height: 30,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.blue,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Todo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20)),
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.blue,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width / 2.23),
                    child: FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) =>
                                SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom:
                                          MediaQuery
                                              .of(context)
                                              .viewInsets
                                              .bottom),
                                      child: AddNote(),
                                    )));
                      },
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ],
          );
        }
        ),
    );
  }
}

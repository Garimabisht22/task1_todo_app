import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/notes_data.dart';

class SearchScreen extends StatefulWidget {
  List<String> Notes;
  SearchScreen({required this.Notes});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> SearchNotes = [];

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _textEditingController.clear();
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ))
          ],
          backgroundColor: Colors.cyan,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.cyan.shade200,
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  SearchNotes = widget.Notes.where((element) =>
                          element.toLowerCase().contains(text.toLowerCase()))
                      .toList();
                });
              },
              autofocus: false,
              controller: _textEditingController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: "Search a note..."
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  ),
            ),
          ),
        ),
        body: _textEditingController.text.isNotEmpty && SearchNotes.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 70,
                      color: Colors.cyan,
                    ),
                    Text(
                      "No Results Found",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                    itemCount: _textEditingController.text.isNotEmpty
                        ? SearchNotes.length
                        : widget.Notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        shadowColor: Colors.teal,
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            _textEditingController.text.isNotEmpty
                                ? SearchNotes[index]
                                : widget.Notes[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}

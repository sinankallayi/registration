import 'package:flutter/material.dart';
import 'package:registration/services/note_services.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 30,
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: TextField(
          controller: titleController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.title,
              color: Color.fromARGB(255, 38, 82, 104),
            ),
            hintText: "Title",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 38, 82, 104),
              fontSize: 15,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 223, 190, 219),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: TextField(
          controller: descriptionController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.description,
              color: Color.fromARGB(255, 38, 82, 104),
            ),
            hintText: "Description",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 38, 82, 104),
              fontSize: 15,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 223, 190, 219),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          await addnotes(
            title: titleController.text,
            description: descriptionController.text,
            context: context,
          );
          setState(() {
            isLoading = false;
          });
        },
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                "Add Note",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 223, 190, 219),
                ),
              ),
      )
    ]));
  }
}

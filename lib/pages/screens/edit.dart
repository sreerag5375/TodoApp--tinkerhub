import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';
import 'package:todo_app/widgets/spacing.dart';

class EditScreen extends StatelessWidget {
  String id;
  String title;
  String description;
  String update;
  EditScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.update});

  final CollectionReference task =
      FirebaseFirestore.instance.collection('task');

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController domainController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    descriptionController.text=description;
    titleController.text=title;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacing(height: 20),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: 'task name', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'task description', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    updateData();
                  },
                  child: const Text('UPDATE'))
            ],
          ),
        ));
  }

  Future<void> updateData() async {
    print("UPDATE");
    final username = await getString(stringKey: "username");
    DocumentReference userDocument = task.doc(username);
    CollectionReference userTasks = userDocument.collection("nodeCollection");
    await userTasks.doc(id).update({
      "description": descriptionController.text,
      "title": titleController.text
    });
  }

  
}

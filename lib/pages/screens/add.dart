import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';
import 'package:todo_app/widgets/spacing.dart';

class AddScreen extends StatelessWidget {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('task');

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController domainController = TextEditingController();

  Future<void> addTask(BuildContext context) async {
    final data = {
      'description': descriptionController.text,
      'title': titleController.text,
    };

    final usernameId = await getString(stringKey: "username");
    // final dateTime = DateTime.now().microsecondsSinceEpoch;
    final userID = "$usernameId";
    /* saveString(value: "subcollectionNode", stringKey: usernameId);
    final nodeCollection=await getNode();*/
    DocumentReference userDocument = task.doc(userID);
    CollectionReference userTasks = userDocument.collection("nodeCollection");
    await userTasks.add(data);
  }

  @override
  Widget build(BuildContext context) {
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
                    addTask(context);
                  },
                  child: const Text('ADD TASK'))
            ],
          ),
        ));
  }

  // add user
}

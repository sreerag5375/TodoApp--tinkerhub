import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';
import 'package:todo_app/pages/screens/add.dart';
import 'package:todo_app/pages/screens/edit.dart';
import 'package:todo_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('task');
  String usernameId = "q";

//   String subCollection="q";
  //final userID = "$usernameId$dateTime";

  getDatashared() async {
    usernameId = await getString(stringKey: "username");
    //  subCollection = await getNode();
  }

  @override
  Widget build(BuildContext context) {
    getDatashared();
    return Scaffold(
      // backgroundColor: AppColors.PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 163, 153, 233),
        // title: const Text('home'),
      ),
      body: StreamBuilder(
        stream: task.doc("sree").collection("nodeCollection").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final DocumentSnapshot taskSnap = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(taskSnap['title']),
                    subtitle: Text(taskSnap['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return EditScreen(
                                  id: taskSnap.id,
                                  description: taskSnap['description'],
                                  title: taskSnap['title'],
                                  update: "update",
                                );
                              }));
                              print("task id${taskSnap.id}");
                              /*  pushNamed(context, '/addTask',
                                  arguments: AddScreen(
                                    taskSnap.id,
                                    taskSnap['title'],
                                    taskSnap['description'],
                                    "update"
                              ));*/
                              print(taskSnap.toString());
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deleteItem(taskSnap);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.data!.docs.length);
          }

          return const Center(
            child: Text('no data'),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 50.0,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            onPressed: () {
              // Add your onPressed code here!
              Navigator.pushNamed(context, '/addTask');
            },
            backgroundColor: AppColors.ASCENT_COLOR,
            child: const Text('Add Task'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> deleteItem(DocumentSnapshot<Object?> taskSnap) async {
    DocumentReference userDocument = task.doc(usernameId);
    CollectionReference userTasks = userDocument.collection("nodeCollection");
    await userTasks.doc(taskSnap.id).delete();
  }

  /* methods(AsyncSnapshot<QuerySnapshot<Object?>> snapshot)  {
    return;
  }*/
  // void methods(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  //   final usernameId = getString(stringKey: "username");
  //   final dateTime = DateTime.now().microsecondsSinceEpoch;
  //   final userID = "$usernameId$dateTime}";
  //   FirebaseFirestore.instance
  //       .collection('task')
  //       .doc(userID)
  //       .collection("$userID$userID")
  //       .snapshots()
  //       .listen((snapshot) {
  //     snapshot.docs.forEach((doc) {
  //       print('Task Title: ${doc.data()['title']}');
  //       print('Task Description: ${doc.data()['description']}');
  //       // print other fields...
  //     });
  //   });
  // }
}


// Future<String> getString({required String stringKey}) async {
//   SharedPreferences sharedPref = await SharedPreferences.getInstance();
//   return sharedPref.getString(stringKey)!;
// }
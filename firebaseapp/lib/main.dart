import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskScreen());
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final CollectionReference _tasks = FirebaseFirestore.instance.collection(
    'tasks',
  );
  Future<void> _createOrUpdate([DocumentSnapshot? document]) async {
    String action = document == null ? 'create' : 'update';
    if (document != null) {
      _titleController.text = document['title'];
      _priorityController.text = document['priority'].toString();
    }
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(action == 'create' ? 'Add Task' : 'Update Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ), // TextField
                TextField(
                  controller: _priorityController,
                  decoration: InputDecoration(labelText: 'Priority'),
                  keyboardType: TextInputType.number,
                ), // TextField
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ), // TextButton
              TextButton(
                onPressed: () async {
                  final String title = _titleController.text;
                  final int? priority = int.tryParse(_priorityController.text);
                  if (title.isNotEmpty && priority != null) {
                    if (action == 'create') {
                      await _tasks.add({'title': title, 'priority': priority});
                    } else {
                      await _tasks.doc(document!.id).update({
                        'title': title,
                        'priority': priority,
                      });
                    }
                    _titleController.clear();
                    _priorityController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text(action == 'create' ? 'Add' : 'Update'),
              ), // TextButton
            ],
          ), // AlertDialog
    );
  }

  // Delete Task
  Future<void> _deleteTask(String id) async {
    await _tasks.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Manager')),
      body: StreamBuilder(
        stream: _tasks.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children:
                snapshot.data!.docs.map((doc) {
                  return ListTile(
                    title: Text(doc['title']),
                    subtitle: Text('Priority: ${doc['priority']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _createOrUpdate(doc),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteTask(doc.id),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_final/utils/dialog_box.dart';
import '../data/database.dart';
import '../utils/todo_tiles.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void changeTaskState(int index) {
    setState(() {
      db.toDoTasks[index][1] = !db.toDoTasks[index][1];
    });
    db.updateData();
  }

  void addNewTask() {
    setState(() {
      db.toDoTasks.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: addNewTask,
              onCancel: () => {Navigator.of(context).pop()});
        });
    db.updateData();
  }

  void deleteExistingTask(index) {
    setState(() {
      db.toDoTasks.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text('TO DO'),
      ),
      body: ListView.builder(
          itemCount: db.toDoTasks.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: db.toDoTasks[index][0],
              isTaskCompleted: db.toDoTasks[index][1],
              onChanged: (value) => {changeTaskState(index)},
              onDelete: (context) => {deleteExistingTask(index)},
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {createNewTask()},
        child: Container(
          child: Icon(
            Icons.add,
          ),
        ),
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}

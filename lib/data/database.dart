import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoTasks = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoTasks = [
      ['Complete Tech Implementation', false],
      ['Launch Final Product', false]
    ];
  }

  void loadData() {
    toDoTasks = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', toDoTasks);
  }
}

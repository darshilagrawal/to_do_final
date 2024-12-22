import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext) onDelete;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12))
        ]),
        child: GestureDetector(
          onTap: () => {onChanged(isTaskCompleted)},
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Checkbox(value: isTaskCompleted, onChanged: null),
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 16,
                      decoration: isTaskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

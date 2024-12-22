import 'package:flutter/material.dart';
import 'package:to_do_final/utils/custom_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[500],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter New Task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(onPressed: () => {onSave()}, buttonTitle: 'Save'),
                const SizedBox(width: 16),
                CustomButton(
                    onPressed: () => {onCancel()}, buttonTitle: 'Cancel')
              ],
            )
          ],
        ),
      ),
    );
  }
}

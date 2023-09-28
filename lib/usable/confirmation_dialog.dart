import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitConfirmationDialog extends StatelessWidget {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
  final Function onConfirm;

  ExitConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit App?'),
      content: Text('Are you sure you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel',
            style: TextStyle(color: customColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
          },
          child: Text('Exit',
            style: TextStyle(color: customColor,
            ),
          ),
        ),
      ],
    );
  }
}

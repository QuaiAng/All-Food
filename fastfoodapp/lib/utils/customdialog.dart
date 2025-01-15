import 'package:flutter/material.dart';

class Customdialog {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

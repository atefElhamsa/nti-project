import 'package:flutter/material.dart';

messageSnakeBar({
  required BuildContext context,
  required String content,
  required Color color,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(content),
      duration: const Duration(seconds: 1),
    ),
  );
}

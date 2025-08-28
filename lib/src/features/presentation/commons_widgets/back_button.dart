import 'package:flutter/material.dart';

Widget backButton(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back, 
      color: color,
      size: 20,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

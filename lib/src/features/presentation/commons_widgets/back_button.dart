import 'package:flutter/material.dart';

class BackButtonView extends StatelessWidget {
  Color color;
  BackButtonView({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
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
}


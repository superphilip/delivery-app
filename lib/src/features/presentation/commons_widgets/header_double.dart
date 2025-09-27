import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/header_text.dart';
import 'package:flutter/material.dart';

class DoubleTextView extends StatelessWidget {
  final String textHeader;
  final String textAction;
  Function()? textActionTapped;

  DoubleTextView({
    super.key,
    required this.textHeader,
    required this.textAction,
    this.textActionTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          headerText(textHeader, Colors.black, 20, FontWeight.bold),
          Spacer(),
          GestureDetector(
            onTap: textActionTapped,
            child: headerText(textAction, orange, 15, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

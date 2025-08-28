import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/header_text.dart';
import 'package:flutter/material.dart';

Widget headerDoubleText({String textHeader = '', String textAction = '', Function()? func}) {
  return Container(
    child: Row(
      children: [
        headerText(textHeader, Colors.black, 20, FontWeight.bold),
        Spacer(),
        GestureDetector(
          onTap: func,
          child: headerText(textAction, orange, 15, FontWeight.w500))
      ],
    ),
  );
}

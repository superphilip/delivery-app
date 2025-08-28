import 'package:flutter/material.dart';

Widget headerText(String texto, Color color, double fontSize, FontWeight fontWeight, {TextAlign textAlign = TextAlign.justify, TextOverflow? overflow}) {
  return Text(
    texto,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
    textAlign: textAlign,
    overflow: overflow,
  );
}

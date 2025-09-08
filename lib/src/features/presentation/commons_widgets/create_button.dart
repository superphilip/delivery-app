import 'package:flutter/material.dart';

//AssetImage('assets/facebook.png')
//'Connect with facebook'

Widget createButton({
  double width = 350,
  double height = 45,
  EdgeInsetsGeometry margin = const EdgeInsets.only(top: 20),
  Image? image,
  required Color color,
  Color colortext = Colors.white,
  double? elevation,
  EdgeInsetsGeometry? marginText,
  required double fontSize,
  required String labelButton,
  void Function()? func,
  OutlinedBorder? shape
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    child: ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: color,
        shape: shape
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ?image,
          Container(
            margin: marginText,
            child: Text(
              labelButton,
              style: TextStyle(color: colortext, fontSize: fontSize),
            ),
          ),
        ],
      ),
    ),
  );
}

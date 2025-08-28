import 'package:flutter/material.dart';

Color? color = Colors.white;

const boxShadows = [
  BoxShadow(
    color: Color.fromRGBO(210, 211, 215, 1.0),
    offset: Offset(0, 5),
    blurRadius: 10.0,
  ),
];

Decoration createBoxDecorationWithShadows({
  BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(20))
}) {
  return BoxDecoration(
    borderRadius: borderRadius,
    color: color,
    boxShadow: boxShadows,
  );
}

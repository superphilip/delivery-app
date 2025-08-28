import 'package:flutter/material.dart';


Widget card({
  required BuildContext context,
  Image image = const Image(
    width: 160,
    height: 130,
    fit: BoxFit.cover,
    image: NetworkImage(
      'https://plus.unsplash.com/premium_photo-1726786807362-6f2555166804?q=80&w=1454&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ),
  required Widget headtitle,
  EdgeInsetsGeometry marginheadtitle = const EdgeInsets.only(top: 5),
  required Widget headsubtitle,
  EdgeInsetsGeometry marginheadsubtitle = const EdgeInsets.only(top: 5),
}) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(20), child: image),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: marginheadtitle, child: headtitle),
            Container(margin: marginheadsubtitle, child: headsubtitle),
          ],
        ),
      ],
    ),
  );
}

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';


//EdgeInsets.only(left: 10) mar
// EdgeInsets.symmetric(vertical: 10),
//"Andy & Cindy's Diner"
Widget popularesCard({
  required BuildContext context,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Image image = const Image(
    width: 80,
    height: 80,
    fit: BoxFit.cover,
    image: NetworkImage('https://plus.unsplash.com/premium_photo-1723514434077-60471e3f9f17?q=80&w=1612&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ),
  required String title,
  required String subtitle,
  required String review,
  required String ratings,
  Widget? button

}) {
  return Column(
    children: [
      Container(
        margin: margin,
        padding: padding,
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: headerText(
                      title,
                    Colors.black,
                      17,
                      FontWeight.bold,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 5),
                    child: headerText(
                      subtitle,
                      gris,
                      13,
                      FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: amarillo, size: 16),
                      Text(
                        review,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          ratings,
                          style: TextStyle(
                            color: gris,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      ?button          
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

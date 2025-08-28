import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';

//AssetImage('assets/lock.png')
//'Your password has been reset'
//You'll shortly receive an email with a code to setup a new passwword.
//'Done'
//Navigator.pushNamed(context, 'login')

Future showAlertDialog(
  BuildContext context,
  Image imagePath,
  String headerTitle,
  String headerSubTitle,
  Widget doneButton
) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              imagePath,
              Container(
                margin: EdgeInsets.all(15),
                child: headerText(
                  headerTitle,
                  primaryColor,
                  20,
                  FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: headerText(
                  headerSubTitle,
                  primaryColor,
                  15,
                  FontWeight.w400,
                ),
              ),
              doneButton
            ],
          ),
        ),
      );
    },
  );
}



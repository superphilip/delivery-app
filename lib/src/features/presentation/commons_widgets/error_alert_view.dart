import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/create_button.dart';
import 'package:flutter/material.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog({
    required BuildContext context,
    required String subTitle,
    dynamic Function()? ctaButtonAction,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          content: SizedBox(
            height: 320,
            child: Column(
              children: [
                const Image(
                  width: 130,
                  height: 130,
                  image: AssetImage('assets/errorIcon.png'),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text('Network error', style: TextStyle(
                    color: primaryColor,
                    fontSize: 20
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(subTitle, style: TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                  )),
                ),
                createButton(color: orange, fontSize: 15, labelButton: 'Ir a inicio', shape: StadiumBorder(), func: ctaButtonAction),
              ],
            ),
          ),
        );
      },
    );
  }
}

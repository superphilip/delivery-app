import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  String textHeader;
  String textAction;

  HeaderView({super.key, required this.textHeader, required this.textAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: headerText(textHeader, Colors.black, 20, FontWeight.bold),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              textAction,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Icon(Icons.play_arrow),
          ],
        ),
      ],
    );
  }
}

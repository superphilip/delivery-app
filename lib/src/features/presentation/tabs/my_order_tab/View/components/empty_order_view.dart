import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

import 'package:flutter/material.dart';


class EmptyOrderView extends StatelessWidget {
 const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        leading: Text(''),
        backgroundColor: white,
        title: headerText('My Order', primaryColor, 17, FontWeight.w600),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 216,
                height: 216,
                image: AssetImage('assets/emptyOrder.png')
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: headerText('Cart Empty', gris, 25, FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: headerText('Good food is always cooking! Go ahead, order some yummy items from the menu.', gris, 17, FontWeight.w500, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
   );
  }
}
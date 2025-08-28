import 'dart:ui';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: headerText(
                    'DELIVERED FAST FOOD TO YOUR DOOR',
                    Colors.white,
                    45,
                    FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 30.0,
                  ),
                  child: headerText(
                    'Set exact location to find the right restaurants near you.',
                    Colors.white,
                    17,
                    FontWeight.w400,
                  ),
                ),
                createButton(
                  color: orange,
                  marginText: EdgeInsets.only(left: 10),
                  fontSize: 15,
                  labelButton: 'Log in',
                  func: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),
                createButton(
                  image: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('assets/facebook.png'),
                  ),
                  color: buttonColor,
                  marginText: EdgeInsets.only(left: 10),
                  fontSize: 15,
                  labelButton: 'Connect with facebook',
                  func: () => print('goTofacebook'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

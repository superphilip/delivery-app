
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:flutter/material.dart';

class Loadingview extends StatelessWidget {
  const Loadingview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              backgroundColor: orange,
            ),
            SizedBox(height: 10),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
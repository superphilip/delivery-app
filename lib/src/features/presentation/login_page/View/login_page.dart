import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';

//Widgets
import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';


//UI
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height) - 500,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEMDd9&auto=format&fit=crop&w=500&q=60',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: backButton(context, Colors.white),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0, -20),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      headerText('Welcome Back', primaryColor, 30, FontWeight.bold),
                      headerText('Login to you account', gris, 15, FontWeight.w500),
                      _emailInput(),
                      _passwordInput(),
                      createButton(margin: EdgeInsets.only(top: 30), color: orange, marginText: EdgeInsets.only(left: 10), fontSize: 15, labelButton: 'Log in', func: () => Navigator.pushNamed(context, 'tabs')),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'forgot-password');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: headerText('Forgot you password?', Colors.black, 17, FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            headerText("Don't have an account?", gris, 15, FontWeight.w500),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(context, 'sign-up'),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: 
                                  headerText('Sign up', orange, 15, FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: EdgeInsets.only(top: 40),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: EdgeInsets.only(top: 15),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}


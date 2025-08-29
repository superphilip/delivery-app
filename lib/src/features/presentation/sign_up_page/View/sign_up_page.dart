
import 'package:flutter/material.dart';

//colors
import 'package:delivery_app/src/Colors/colors.dart';

//Widgets
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              headerText('Create an account', primaryColor, 30, FontWeight.bold),
              _usernameInput(context),
              _emailInput(context),
              _phoneInput(context),
              _dateOfBirthInput(context),
              _passwordInput(context),
              createButton(margin: EdgeInsets.only(top: 30), marginText: EdgeInsets.only(left: 10), color: orange, fontSize: 15, labelButton: 'Sign up', func: () => Navigator.pushNamed(context, 'login')),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: 
                  headerText('By clicking Sign up you agree to the following terms and Conditions without reservation', Colors.black, 13, FontWeight.w400),
              )

            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40)
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Username',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40)
    ),
    child: TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _phoneInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40)
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _dateOfBirthInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40)
    ),
    child: TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Date of Birth',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40)
    ),
    child: TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}
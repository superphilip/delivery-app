import 'package:delivery_app/src/Features/presentation/forgot_password_page/View/Components/TextFormFieldForgotEmail.dart';
import 'package:delivery_app/src/Features/presentation/forgot_password_page/ViewModel/ForgotPasswordViewModel.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

//Colors
import 'package:delivery_app/src/Colors/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotPasswordViewModel _viewModel;

  _ForgotPasswordState({ForgotPasswordViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              headerText('Forgot password', primaryColor, 30, FontWeight.bold),
              Container(
                padding: EdgeInsets.all(10),
                child: headerText(
                  'Please enter your email address. You will receive a link to create a new password via email. ',
                  Colors.black,
                  15,
                  FontWeight.w400,
                ),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: _viewModel),
              // _seendButton(context),
              createButton(
                width: 370,
                margin: EdgeInsets.only(top: 40),
                color: orange,
                marginText: EdgeInsets.only(left: 10),
                fontSize: 17,
                labelButton: 'Send',
                func: () => _ctaButtonTapped(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _seendButton(BuildContext context) {
//   return Container(
//     width: 350,
//     height: 45,
//     margin: EdgeInsets.only(top: 30),
//     child: ElevatedButton(
//       onPressed: () {
//         _showAlerta(context);
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//       ),
//       child: Text('Send', style: TextStyle(color: Colors.white, fontSize: 15)),
//     ),
//   );
// }

extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped(BuildContext context) {
    _viewModel.updatePassword().then((value) {
      showAlertDialog(
        context,
        Image(width: 130, height: 130, image: AssetImage('assets/lock.png')),
        'Your password has been reset',
        "You'll shortly receive an email with a code to setup a new passwword.",
        createButton(
          width: 370,
          margin: EdgeInsets.only(top: 20),
          color: orange,
          marginText: EdgeInsets.only(left: 10),
          fontSize: 17,
          labelButton: 'Done',
          func: () => Navigator.pushNamed(context, 'login'),
        ),
      );
    });
  }
}

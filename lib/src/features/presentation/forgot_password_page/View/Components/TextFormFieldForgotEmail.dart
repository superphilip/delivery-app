import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/forgot_password_page/ViewModel/ForgotPasswordViewModel.dart';
import 'package:delivery_app/src/Utils/Helpers/Validators/FormValidators.dart';
import 'package:flutter/material.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;

  const TextFormFieldEmailUpdatePassword({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: bgInputs,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        validator: (value) =>
            EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (NewValue) => viewModel.email = NewValue,
      ),
    );
  }
}

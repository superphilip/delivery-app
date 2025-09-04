import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Utils/Helpers/Validators/FormValidators.dart';
import 'package:flutter/material.dart';

mixin TextFormFieldDelegate {
  onChanged({
    required String newValue,
    required CustomTextFormFieldType customTextFormFieldType,
  });
}

enum CustomTextFormFieldType { email, password, phone, username, dateOfBirth }

class CustomTextFormField extends StatelessWidget {
  final CustomTextFormFieldType textFormFieldType;
  final String hintText;
  final TextFormFieldDelegate delegate;
  final TextEditingController? _controller;

  const CustomTextFormField({
    super.key,
    required this.textFormFieldType,
    required this.hintText,
    required this.delegate,
    TextEditingController? controller,
  }) : _controller = controller;

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
        controller: _controller,
        keyboardType: _getKeyboardType(textFormFieldType: textFormFieldType),
        obscureText: textFormFieldType == CustomTextFormFieldType.password
            ? true
            : false,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: (newValue) => delegate.onChanged(
          newValue: newValue,
          customTextFormFieldType: textFormFieldType,
        ),
        validator: (value) {
          switch (textFormFieldType) {
            case CustomTextFormFieldType.email:
              return EmailFormValidator.validateEmail(email: value ?? '');
            case CustomTextFormFieldType.password:
              return PasswordFormValidator.validatePassword(
                password: value ?? '',
              );
            case CustomTextFormFieldType.username:
              return DefaultFormValidator.validateField(value: value ?? '');
            case CustomTextFormFieldType.phone:
              return DefaultFormValidator.validateField(value: value ?? '');
            default:
              return null;
          }
        },
      ),
    );
  }

  TextInputType? _getKeyboardType({
    required CustomTextFormFieldType textFormFieldType,
  }) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
    
    
  }
}

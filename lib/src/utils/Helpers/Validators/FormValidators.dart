class EmailFormValidator {
  static String message = 'El email no es válido';
  static String? validateEmail({required String email}) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    
    return regExp.hasMatch(email) ? null : message;
  }
}

class PasswordFormValidator {
  static String message = 'La contraseña no es correcta';
  static String? validatePassword({required String password}) {
    return password.length >= 6 ? null : message;
  }
}

class DefaultFormValidator {
  static String message = 'Este campo es obligatorio';
  static String? validateField({required String value}) {
    return value.isNotEmpty ? null : message;
  }
}

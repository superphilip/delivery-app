abstract class AppFailureMessages {
  static String unExpectedErrorMessage = "Ha ocurrido un error inesperado";
}

abstract class FBFailureMessages {
  static String emailNotFoundMessage =
      "There is no user record corresponding to this identifier. The user may have been delated.";
  static String invalidPasswordMessage =
      "The password is invalid or the user does not have a password";
  static String emailExitMessage =
      "The email address is already in use by another account.";
  static String tooManyAttemptsMessage =
      "We've blocked all requests from this device due to unusual activity. Please try again later.";
  static String invalidIdTokenMessage =
      "The user's credential is no longer valid. The user must log in again.";
  static String userNotFoundMessage =
      "There is no user record corresponding to this identifier. The user may have been deleted.";
}

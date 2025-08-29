import 'package:delivery_app/src/Base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  Apiservice apiservice = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String adminToken = "AIzaSyACuwED9cA6JCokPeoIn1qELnYWxi7Em3U";
}

abstract class SignUpFirebase extends BaseFirebaseService {
  String endpoint =
      BaseFirebaseService.baseUrl +
      BaseFirebaseService.signUpEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signUp({
    required Map<String, dynamic> bodyParameters,
  });

}

abstract class SignInFirebase extends BaseFirebaseService {
  String endpoint =
      BaseFirebaseService.baseUrl +
      BaseFirebaseService.signInEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signIn({
    required Map<String, dynamic> bodyParameters,
  });
}

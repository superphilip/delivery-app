import 'package:delivery_app/src/Services/GoogleSignInService/Entities/GoogleUserEntity.dart';

abstract class GoogleSignInService {
  Future<void> initSignIn();
  Future<GoogleSignInUserEntity?> signInWithGoogle();
  Future<bool> isUserInDatabase({required String uid});
  Future<void> signOutGoogle();
}

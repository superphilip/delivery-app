import 'package:delivery_app/src/Services/GoogleSignInService/Entities/GoogleUserEntity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(
    UserCredential credential,
    String? idToken,
  ) {
    return GoogleSignInUserEntity(credential.user, idToken);
  }
}

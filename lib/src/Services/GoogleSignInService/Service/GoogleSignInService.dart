import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Entities/GoogleUserEntity.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Interfaces/interfaces.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Mappers/GoogleSignInMappers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DefaultGoogleSignInService extends GoogleSignInService {
  final RealtimeDatabaseService _realtimeDataBaseService;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final String _path = "users/";
  bool isInitialize = false;

  // Dependencies
  DefaultGoogleSignInService({
    GoogleSignIn? googleSignIn,
    RealtimeDatabaseService? realtimeDataBaseService,
  }) : _realtimeDataBaseService =
           realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            '758370052462-r813rc6pgtgsb6ialdeg88s6p45tu8tf.apps.googleusercontent.com',
      );
    }
    isInitialize = true;
  }

  @override
  Future<GoogleSignInUserEntity?> signInWithGoogle() async {
    try {
      initSignIn();
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;

      // Obtain the auth details from the request
      GoogleSignInClientAuthorization? googleAuth = await authorizationClient
          .authorizationForScopes(['email', 'profile']);

      final acessToken = googleAuth?.accessToken;
      if (acessToken == null) {
        final authorization = await authorizationClient.authorizationForScopes([
          'email',
          'profile',
        ]);

        if (authorization?.accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }

        googleAuth = authorization;
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: acessToken,
        idToken: idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return GoogleSignInMapper.mapUserCredential(userCredential, idToken);
    } on PlatformException catch (e) {
      if (e.code == 'canceled') {
        return null;
      }
      rethrow;
    } catch (e) {
      print('An unexpected error occurred: $e');
      return null;
    }
    
  }

  @override
  Future<bool> isUserInDatabase({required String uid}) async {
    final fullpath = _path + uid;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return result.isNotEmpty;
    } on Failure {
      return false;
    }
  }

  @override
  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      rethrow;
    }
  }
}


import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/AuthFirebaseInterfaces.dart';

class DefaultSignInService extends SignInFirebase {
  @override
  Future<Map<String, dynamic>> signIn({
    required Map<String, dynamic> bodyParameters,
  }) {
    return apiservice.getDataFromPostRequest(
      bodyParameters: bodyParameters,
      url: endpoint,
    );
  }
}
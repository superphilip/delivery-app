
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/AuthFirebaseInterfaces.dart';

class DefaultSignUpService extends SignUpFirebase {
  @override
  Future<Map<String, dynamic>> signUp({
    required Map<String, dynamic> bodyParameters,
  }) {
    return apiservice.getDataFromPostRequest(
      bodyParameters: bodyParameters,
      url: endpoint,
    );
  }
}

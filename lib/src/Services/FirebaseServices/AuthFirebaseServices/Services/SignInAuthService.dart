
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignInService extends SignInService {
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
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/BodyParameters/UpdatePasswordUserServiceBodyParameters.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {
  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
    final _params = UpdatePasswordBodyParameters(
      requestType: _requestType,
      email: email,
    );
    return apiservice.getDataFromPostRequest(
      bodyParameters: _params.toMap(),
      url: endpoint,
    );
  }
}

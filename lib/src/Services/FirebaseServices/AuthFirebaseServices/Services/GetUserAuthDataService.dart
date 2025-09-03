import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {
  @override
  Future<Map<String, dynamic>> getUserAuthData({
    required Map<String, dynamic> bodyParameters,
  }) {
    return apiservice.getDataFromPostRequest(
      bodyParameters: bodyParameters,
      url: endpoint,
    );
  }
}

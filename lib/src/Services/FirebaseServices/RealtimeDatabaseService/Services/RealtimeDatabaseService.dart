import 'package:delivery_app/src/Base/ApiService/ApiService.dart';
import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {
  final Apiservice _apiservice;

  DefaultRealtimeDatabaseService({Apiservice? apiService})
    : _apiservice = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiservice.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> postData({
    required Map<String, dynamic> bodyParameters,
    required String path,
  }) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiservice.getDataFromPostRequest(
        bodyParameters: bodyParameters,
        url: endpoint,
      );
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> putData({
    required Map<String, dynamic> bodyParameters,
    required String path,
  }) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiservice.getDataFromPutRequest(
        bodyParameters: bodyParameters,
        url: endpoint,
      );
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }
}

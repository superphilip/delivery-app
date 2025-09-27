import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Decodables/User/UserDecodable.dart';
import 'package:delivery_app/src/Features/data/Repositories/User/UserBodyParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultSaveUserDataRepository({
    RealtimeDatabaseService? realtimeDatabaseService,
  }) : _realtimeDatabaseService =
           realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({
    required Userbodyparameters parameters,
  }) async {
    if (parameters.localId == null) {
      return Result.failure(
        Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage),
      );
    }

    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDatabaseService.putData(
        bodyParameters: parameters.toMap(),
        path: path,
      );
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}

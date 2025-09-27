import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Services/GetUserAuthDataService.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({
    GetUserAuthDataService? getUserAuthDataService,
  }) : _getUserAuthDataService =
           getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({
    required GetUserDataBodyParameters parameters,
  }) async {
    try {
      final result = await _getUserAuthDataService.getUserAuthData(
        bodyParameters: parameters.toMap(),
      );
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (f) {
      return Result.failure(
        Failure.getFirebaseAuthErrorMessage(error: f.error),
      );
    }
  }
}

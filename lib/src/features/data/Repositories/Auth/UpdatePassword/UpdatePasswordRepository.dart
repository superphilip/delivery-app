import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Services/UpdatePasswordUserService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/UpdatePasswordDecodable.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  final UpdatePasswordUserService _updatePasswordService;

  DefaultUpdatePasswordRepository({
    UpdatePasswordUserService? updatePasswordService,
  }) : _updatePasswordService =
           updatePasswordService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({
    required String email,
  }) async {
    try {
      final result = await _updatePasswordService.updatePassword(email: email);
      var decodable = UpdatePasswordDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
        Failure.getFirebaseAuthErrorMessage(error: f.error),
      );
    }
  }
}

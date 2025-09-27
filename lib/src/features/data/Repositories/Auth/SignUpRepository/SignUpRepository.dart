import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';

import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Services/SignUpAuthService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/SignUpDecodable.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {
  //Dependencias
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
    : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp({
    required SignUpRepositoryParameters params,
  }) async {
    try {
      final result = await _signUpService.signUp(
        bodyParameters: params.toMap(),
      );
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}

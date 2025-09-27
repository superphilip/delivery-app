

import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/Services/SignInAuthService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/SignInDecodable.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

class DefaultSignInRepository extends SignInRepository {

  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService}) : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params}) async {
    try {
      final result = await _signInService.signIn(bodyParameters: params.toMap());
      SignInDecodable decodable = SignInDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}
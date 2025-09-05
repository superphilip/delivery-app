import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class ValidateCurrentUserUseCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUseCase {
  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserUseCase({UserAuthDataUseCase? userAuthDataUseCase})
    : _authDataUseCase = userAuthDataUseCase ?? DefaultUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _authDataUseCase
          .execute(parameters: GetUSerDataUseCaseParameters(idToken: idToken))
          .then((result) {
            switch (result.status) {
              case ResultStatus.success:
                return true;
              case ResultStatus.error:
                return false;
            }
          });
    } on Failure {
      return false;
    }
  }
}

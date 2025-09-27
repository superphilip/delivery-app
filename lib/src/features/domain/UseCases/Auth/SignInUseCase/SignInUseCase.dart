import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignInRepository/SignInRepository.dart';
import 'package:delivery_app/src/Features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute({
    required SignInUseCaseBodyParameters params,
  });
}

class DefaultSignInUseCase extends SignInUseCase {
  final SignInRepository _signInRepository;

  DefaultSignInUseCase({SignInRepository? signInRepository})
    : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute({
    required SignInUseCaseBodyParameters params,
  }) {
    return _signInRepository
        .signIn(
          params: SignInBodyParameters(
            email: params.email,
            password: params.password,
          ),
        )
        .then((result) {
          switch (result.status) {
            case ResultStatus.success:
              if (result.value == null) {
                return Result.failure(
                  Failure.fromMessage(
                    message: AppFailureMessages.unExpectedErrorMessage,
                  ),
                );
              }
              var entity = SignInEntity.fromMap(result.value!.toMap());
              return Result.success(entity);
            case ResultStatus.error:
              return Result.failure(result.error);
          }
        });
  }
}

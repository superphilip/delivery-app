import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/UserAuthData/UserAuthDataRepository.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:delivery_app/src/Features/domain/Entities/Auth/UserAuthData/UserAuthDataEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute({
    required GetUSerDataUseCaseParameters parameters,
  });
}

class DefaultUserAuthDataUseCase implements UserAuthDataUseCase {
  final UserAuthDataRepository _userAuthDataRepository;

  DefaultUserAuthDataUseCase({UserAuthDataRepository? userAuthDataRepository})
    : _userAuthDataRepository =
          userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({
    required GetUSerDataUseCaseParameters parameters,
  }) {
    return _userAuthDataRepository
        .getUserAuthData(
          parameters: GetUserDataBodyParameters(idToken: parameters.idToken),
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

              return Result.success(
                UserAuthDataEntity.fromMap(result.value!.toMap()),
              );
            case ResultStatus.error:
              return Result.failure(result.error);
          }
        });
  }
}

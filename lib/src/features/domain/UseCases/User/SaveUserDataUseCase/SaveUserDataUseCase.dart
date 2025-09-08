import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/User/SaveUserDataRepository.dart';
import 'package:delivery_app/src/Features/data/Repositories/User/UserBodyParameters.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({
    required SaveUserDataUseCaseParameters parameters,
  });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? saveUserDataRepository})
    : _saveUserDataRepository =
          saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({
    required SaveUserDataUseCaseParameters parameters,
  }) {
    Userbodyparameters _parameters = Userbodyparameters(
      localId: parameters.localId,
      role: parameters.role?.toShortString(),
      username: parameters.username,
      email: parameters.email,
      phone: parameters.phone,
      dateOfBirth: parameters.dateOfBirth,
      startDate: parameters.startDate,
      photo: parameters.photo,
      shippingAddress: parameters.shippingAddress,
      bilingAddress: parameters.billingAddress,
      idToken: parameters.idToken,
    );

    return _saveUserDataRepository.saveUserData(parameters: _parameters).then((
      result,
    ) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(
              Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage,
              ),
            );
          }
          UserEntity _entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(_entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

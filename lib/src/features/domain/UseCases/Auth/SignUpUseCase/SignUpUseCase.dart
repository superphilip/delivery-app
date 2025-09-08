import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignUpRepository/SignUpRepository.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/Features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/Dates/DateHelpers.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery_app/src/Utils/Helpers/UserPhotos/UserPhotoHelper.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({
    required SignUpUseCaseParameters params,
  });
}

class DefaultSignUpUseCase extends SignUpUseCase {
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({
    SignUpRepository? signUpRepository,
    SaveUserDataUseCase? saveUserDataUseCase,
  }) : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
       _saveUserDataUseCase =
           saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({
    required SignUpUseCaseParameters params,
  }) {
    return _signUpRepository
        .signUp(
          params: SignUpRepositoryParameters(
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
              SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());

              return saveUserDataInDataBase(params: params, entity: entity);
            case ResultStatus.error:
              return Result.failure(result.error);
          }
        });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({
    required SignUpUseCaseParameters params,
    required SignUpEntity entity,
  }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
      localId: entity.localId,
      role: UserRole.user,
      username: params.username,
      email: params.email,
      phone: params.phone,
      dateOfBirth: params.date,
      startDate: Datehelpers.getStartDate(),
      photo: UserPhotoHelper.defaultUserPhoto,
      shippingAddress: '',
      billingAddress: '',
      idToken: entity.idToken,
    );

    return _saveUserDataUseCase.execute(parameters: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

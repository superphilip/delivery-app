import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Entities/GoogleUserEntity.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Interfaces/interfaces.dart';
import 'package:delivery_app/src/Services/GoogleSignInService/Service/GoogleSignInService.dart';
import 'package:delivery_app/src/Utils/Helpers/Dates/DateHelpers.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>?> execute();
  Future<void> signOutGoogleSesion();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {
  // Dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase({
    GoogleSignInService? googleSignInService,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
    SaveUserDataUseCase? saveUserDataUseCase,
  }) : _googleSignInService =
           googleSignInService ?? DefaultGoogleSignInService(),
       _saveLocalStorageUseCase =
           saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
       _saveUserDataUseCase =
           saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>?> execute() async {
    final user = await _googleSignInService.signInWithGoogle();
    _saveLocalStorageUseCase.execute(
      parameters: SaveLocalStorageUseCaseParameters(
        key: LocalStorageKeys.idToken,
        value: user?.uid ?? "",
      ),
    );

    final isUserInDatabase = await _googleSignInService.isUserInDatabase(
      uid: user?.uid ?? "",
    );

    if (isUserInDatabase) {
      if (user == null) return null;
      return Result.success(mapUserEntity(user: user));
    } else {
      if (user == null) return null;
      return _saveUserDataInDataBase(user: user);
    }
  }

  @override
  Future<void> signOutGoogleSesion() async {
    await _googleSignInService.signOutGoogle();
  }
}

extension on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase({
    required GoogleSignInUserEntity user,
  }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
      localId: user.uid,
      role: UserRole.user,
      username: user.displayName,
      email: user.email,
      phone: user.phoneNumber,
      dateOfBirth: "",
      startDate: Datehelpers.getStartDate(),
      photo: user.photoURL,
      shippingAddress: '',
      billingAddress: '',
      idToken: user.idToken,
      provider: UserAuthProvider.google,
    );

    return _saveUserDataUseCase.execute(parameters: _params);
  }

  UserEntity mapUserEntity({required GoogleSignInUserEntity user}) {
    return UserEntity(
      localId: user.uid,
      role: UserRole.user.toShortString(),
      username: user.displayName,
      email: user.email,
      phone: user.phoneNumber,
      dateOfBirth: "",
      startDate: Datehelpers.getStartDate(),
      photo: user.photoURL,
      shippingAddress: '',
      billingAddress: '',
      idToken: user.refreshToken,
      provider: UserAuthProvider.google,
    );
  }
}

import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/RemoveLocalStorageUseCase.dart';



abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({
    RemoveLocalStorageUseCase? removeLocalStorageUseCase,
  }) :
    _removeLocalStorageUseCase =
           removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(
      parameters: RemoveLocalStorageUseCaseParameters(
        key: LocalStorageKeys.idToken,
      ),
    );
  }
}

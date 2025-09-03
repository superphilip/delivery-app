import 'package:delivery_app/src/Features/data/Repositories/LocalStorage/RemoveLocalStorageRepository.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({
    required RemoveLocalStorageUseCaseParameters parameters,
  });
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {
  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({
    RemoveLocalStorageRepository? removeLocalStorageRepository,
  }) : _removeLocalStorageRepository =
           removeLocalStorageRepository ??
           DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({
    required RemoveLocalStorageUseCaseParameters parameters,
  }) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(
      key: parameters.key,
    );
  }
}

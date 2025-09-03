import 'package:delivery_app/src/Features/data/Repositories/LocalStorage/SaveLocalStorageRepository.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({required SaveLocalStorageUseCaseParameters parameters});
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase({
    SaveLocalStorageRepository? saveLocalStorageRepository,
  }) : _saveLocalStorageRepository =
           saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({
    required SaveLocalStorageUseCaseParameters parameters,
  }) {
    return _saveLocalStorageRepository.saveInLocalStorage(
      key: parameters.key,
      value: parameters.value,
    );
  }
}

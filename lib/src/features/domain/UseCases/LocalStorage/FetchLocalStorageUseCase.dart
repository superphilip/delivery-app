import 'package:delivery_app/src/Features/data/Repositories/LocalStorage/FetchLocalStorageRepository.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({
    required FetchLocalStorageUseCaseParameters parameters,
  });
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase({
    FetchLocalStorageRepository? fetchLocalStorageRepository,
  }) : _fetchLocalStorageRepository =
           fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute({
    required FetchLocalStorageUseCaseParameters parameters,
  }) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(
      key: parameters.key,
    );
  }
}

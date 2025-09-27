import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/data/Repositories/LocalStorage/SaveLocalStorageRepository.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({required SaveLocalStorageUseCaseParameters parameters});
  Future<void> saveRecentSearchInLocalStorage({required String placeId});
  Future<void> clearRecentSearchInLocalStorage();
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  final SaveLocalStorageRepository _saveLocalStorageRepository;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;

  DefaultSaveLocalStorageUseCase({
    SaveLocalStorageRepository? saveLocalStorageRepository,
    FetchLocalStorageUseCase? fetchLocalStorageUseCase,
  }) : _saveLocalStorageRepository =
           saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository(),
       _fetchLocalStorageUseCase =
           fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase();

  @override
  Future<void> execute({
    required SaveLocalStorageUseCaseParameters parameters,
  }) {
    return _saveLocalStorageRepository.saveInLocalStorage(
      key: parameters.key,
      value: parameters.value,
    );
  }

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _saveLocalStorageRepository.saveRecentSearchInLocalStorage(
      key: LocalStorageKeys.recentSearches,
      value: [],
    );
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({required String placeId}) async {
    final placeIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    if (!placeIds.contains(placeId)) {
      placeIds.add(placeId);
      return _saveLocalStorageRepository.saveRecentSearchInLocalStorage(
        key: LocalStorageKeys.recentSearches,
        value: placeIds,
      );
    }
  }
}

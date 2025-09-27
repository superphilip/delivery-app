import 'package:delivery_app/src/Features/data/Repositories/LocalStorage/FetchLocalStorageRepository.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({
    required FetchLocalStorageUseCaseParameters parameters,
  });
  Future<List<String>> fetchRecentSearches();
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

  @override
  Future<List<String>> fetchRecentSearches() async {
    final recentSearches = await _fetchLocalStorageRepository
        .fetchRecentSearches();
    return recentSearches ?? [];
  }
}

import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Places/PlaceList/PlaceListUseCase.dart';

abstract class SearchPageViewModelInput {
  Future<PlaceListEntity> fetchPlacesListByQuery({required String query});
  Future<PlaceListEntity> fetchPlacesListByRecentSearches();
  Future<PlaceListEntity> fetchPopularPlacesList();
  Future<void> clearRecentSearchInLocalStorage();
}

abstract class SearchPageViewModel extends SearchPageViewModelInput {}

class DefaultSearchPageViewModel extends SearchPageViewModel {
  final PlaceListUseCase _placeListUseCase;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSearchPageViewModel({
    PlaceListUseCase? placelistUseCase,
    FetchLocalStorageUseCase? fetchLocalStorageUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
  }) : _placeListUseCase = placelistUseCase ?? DefaultPlaceListUseCase(),
       _fetchLocalStorageUseCase =
           fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
       _saveLocalStorageUseCase =
           saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _saveLocalStorageUseCase.clearRecentSearchInLocalStorage();
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByQuery({required String query}) {
    return _placeListUseCase.fetchPlacesListByQuery(query: query);
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByRecentSearches() async {
    final placesIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    return _placeListUseCase.fetchPlacesListByRecentSearches(
      placeIds: placesIds,
    );
  }

  @override
  Future<PlaceListEntity> fetchPopularPlacesList() {
    return _placeListUseCase.fetchPopularPlacesList();
  }
}

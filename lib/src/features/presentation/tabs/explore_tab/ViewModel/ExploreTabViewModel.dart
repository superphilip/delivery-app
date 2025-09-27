import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Collections/CollectionsUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Places/PlaceList/PlaceListUseCase.dart';

enum ExploreViewModelState {
  viewLoadedState, errorState
}

abstract class ExploreViewModelInput {
  Future<ExploreViewModelState> viewInitState();
  List<PlaceListDetailEntity> noveltyPlaces = [];
  List<PlaceListDetailEntity> popularPlaces = [];
  List<CollectionDetailEntity> collections = [];
}

// Crear ViewModel
abstract class ExploreViewModel extends ExploreViewModelInput {}

class DefaultExploreViewModel extends ExploreViewModel {

  // Dependencies
  final PlaceListUseCase _placeListUseCase;
  final FetchCollectionUseCase _fetchCollectionUseCase;

  DefaultExploreViewModel({ PlaceListUseCase? placeListUseCase, FetchCollectionUseCase? fetchCollectionUseCase })
    : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
      _fetchCollectionUseCase = fetchCollectionUseCase ?? DefaultFetchCollectionUseCase();

  @override
  Future<ExploreViewModelState> viewInitState() async {
    final noveltyPlacesResult = await _placeListUseCase.fetchNoveltyPlaceList();
    noveltyPlaces = noveltyPlacesResult.placeList ?? [];

    final popularPlacesResult = await _placeListUseCase.fetchPopularPlacesList();
    popularPlaces = popularPlacesResult.placeList ?? [];

    final collectionsResponse = await _fetchCollectionUseCase.execute();
    collections = collectionsResponse.collections ?? [];

    if (noveltyPlaces.isNotEmpty || popularPlaces.isNotEmpty || collections.isNotEmpty) {
      return ExploreViewModelState.viewLoadedState;
    } else {
      return ExploreViewModelState.errorState;
    }
  }
}



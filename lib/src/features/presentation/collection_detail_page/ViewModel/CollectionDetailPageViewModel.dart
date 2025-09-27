import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Places/PlaceList/PlaceListUseCase.dart';

enum CollectionDetailPageViewState { viewLoadedState, errorState }

abstract class CollectionDetailPageViewModelInput {
  Future<CollectionDetailPageViewState> viewInitState();
  CollectionDetailEntity getCollection();
  List<PlaceListDetailEntity> filteredPlacesByCategory = [];
}

abstract class CollectionDetailPageViewModel
    extends CollectionDetailPageViewModelInput {}

class DefaultCollectionDetailPageViewModel
    extends CollectionDetailPageViewModel {
  CollectionDetailEntity collection;
  final PlaceListUseCase _placeListUseCase;

  DefaultCollectionDetailPageViewModel({
    required this.collection,
    PlaceListUseCase? placeListUseCase,
  }) : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase();

  @override
  Future<CollectionDetailPageViewState> viewInitState() async {
    final placeResult = await _placeListUseCase.fetchPlacesListByCategory(
      categoryId: collection.id,
    );
    filteredPlacesByCategory = placeResult.placeList ?? [];
    return CollectionDetailPageViewState.viewLoadedState;
  }

  @override
  CollectionDetailEntity getCollection() {
    return collection;
  }
}

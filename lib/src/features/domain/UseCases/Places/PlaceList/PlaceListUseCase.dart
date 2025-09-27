import 'package:delivery_app/src/Features/data/Repositories/Places/PlaceListRepository.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';

abstract class PlaceListUseCase {
  Future<PlaceListEntity> fetchPlaceList();
  Future<PlaceListEntity> fetchNoveltyPlaceList();
  Future<PlaceListEntity> fetchPopularPlacesList();
  Future<PlaceListEntity> fetchPlacesListByCategory({required int categoryId});
  Future<PlaceListEntity> fetchPlacesListByQuery({required String query});
  Future<PlaceListEntity> fetchPlacesListByRecentSearches({
    required List<String> placeIds,
  });
}

class DefaultPlaceListUseCase extends PlaceListUseCase {
  final PlaceListRepository _placeListRepository;

  DefaultPlaceListUseCase({PlaceListRepository? placeListRepository})
    : _placeListRepository =
          placeListRepository ?? DefaultPlaceListRepository();

  @override
  Future<PlaceListEntity> fetchPlaceList() async {
    final placeListDecodable = await _placeListRepository.fetchPlaceList();
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchNoveltyPlaceList() async {
    final placeListDecodable = await _placeListRepository
        .fetchNoveltyPlaceList();
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPopularPlacesList() async {
    final placeListDecodable = await _placeListRepository
        .fetchPopularPlacesList();
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByCategory({
    required int categoryId,
  }) async {
    final placeListDecodable = await _placeListRepository
        .fetchPlacesListByCategory(categoryId: categoryId);
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByQuery({
    required String query,
  }) async {
    final placeListDecodable = await _placeListRepository
        .fetchPlacesListByQuery(query: query);
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByRecentSearches({
    required List<String> placeIds,
  }) async {
    final placeListDecodable = await _placeListRepository
        .fetchPlacesListByRecentSearches(placeIds: placeIds);
    return PlaceListEntity.fromMap(placeListDecodable.toMap());
  }
}

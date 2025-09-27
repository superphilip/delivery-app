import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/Places/PlaceDetailRepository.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Places/PlaceList/PlaceListUseCase.dart';

abstract class FavouritesPlacesUseCase {
  Future<PlaceListEntity> fetchFavouritesPlaces({required String localId});
  Future<void> saveOrRemoveUserFromPlaceFavourites({
    required String placeId,
    required String localId,
    required bool isFavourite,
  });
}

class DefaultFavouritesPlacesUseCase extends FavouritesPlacesUseCase {
  final PlaceListUseCase _placeListUseCase;
  final PlaceDetailRepository _placeDetailRepository;

  DefaultFavouritesPlacesUseCase({
    PlaceListUseCase? placeListUseCase,
    PlaceDetailRepository? placeDetailRepository,
  }) : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
       _placeDetailRepository =
           placeDetailRepository ?? DefatultPlaceDetailRepository();

  @override
  Future<PlaceListEntity> fetchFavouritesPlaces({
    required String localId,
  }) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    placeList.placeList = placeList.placeList
        ?.where((place) => place.favourites.contains(localId))
        .toList();
    return placeList;
  }

  @override
  Future<void> saveOrRemoveUserFromPlaceFavourites({
    required String placeId,
    required String localId,
    required bool isFavourite,
  }) {
    if (isFavourite) {
      return _saveUserInFavourites(placeId: placeId, localId: localId);
    } else {
      return _removeUserFromFavourites(placeId: placeId, localId: localId);
    }
  }

  Future<void> _saveUserInFavourites({
    required String placeId,
    required String localId,
  }) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    var placeDetail = placeList.placeList?.firstWhere(
      (place) => place.placeId == placeId,
    );
    placeDetail?.favourites.add(localId);
    if (placeDetail == null) {
      return Future.error(AppFailureMessages.unExpectedErrorMessage);
    }
    return _placeDetailRepository.savePlaceDetail(placeDetail: placeDetail);
  }

  Future<void> _removeUserFromFavourites({
    required String placeId,
    required String localId,
  }) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    var placeDetail = placeList.placeList?.firstWhere(
      (place) => place.placeId == placeId,
    );
    placeDetail?.favourites.remove(localId);
    if (placeDetail == null) {
      return Future.error(AppFailureMessages.unExpectedErrorMessage);
    }
    return _placeDetailRepository.savePlaceDetail(placeDetail: placeDetail);
  }
}

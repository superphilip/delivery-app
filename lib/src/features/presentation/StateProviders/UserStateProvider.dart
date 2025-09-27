import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Places/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/FetchUserDataUseCase/FetchUserDataUseCase.dart';
import 'package:delivery_app/src/Features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

mixin FavouritePageChangeStateDelegate {
  placeFromFavouritesRemoved();
}

class DefaultUserStateProvider extends ChangeNotifier
    with FavouritesCardViewDelegate {
  UserEntity? userData;

  final FetchUserDataUseCase _fetchUserDataUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  FavouritePageChangeStateDelegate? favouritePageChangeStateDelegate;

  DefaultUserStateProvider({
    FetchUserDataUseCase? fetchUserDataUseCase,
    FavouritesPlacesUseCase? favouritesPlacesUseCase,
  }) : _fetchUserDataUseCase =
           fetchUserDataUseCase ?? DefaultFetchUserDataUseCase(),
       _favouritesPlacesUseCase =
           favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  fetchUserData({required String localId}) async {
    userData = await _fetchUserDataUseCase.execute(localId: localId);
  }

  Future<List<PlaceListDetailEntity>> fetchUserFavouritePlaces() async {
    var placeList = await _favouritesPlacesUseCase.fetchFavouritesPlaces(
      localId: userData?.localId ?? "",
    );
    return placeList.placeList ?? [];
  }

  @override
  favouriteIconTapped(bool isTapped, String placeId) async {
    await _favouritesPlacesUseCase.saveOrRemoveUserFromPlaceFavourites(
      placeId: placeId,
      localId: MainCoordinator.sharedInstance?.userUid ?? "",
      isFavourite: isTapped,
    );
    if (!isTapped) {
      favouritePageChangeStateDelegate?.placeFromFavouritesRemoved();
    }
  }
}

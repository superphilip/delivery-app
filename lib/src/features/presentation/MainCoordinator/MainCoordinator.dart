import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import 'package:delivery_app/src/Features/presentation/PopularPlacesListPage/PopularPlacesListPage.dart';
import 'package:delivery_app/src/Features/presentation/collection_detail_page/View/collection_detail_page.dart';
import 'package:delivery_app/src/Features/presentation/collection_detail_page/ViewModel/CollectionDetailPageViewModel.dart';
import 'package:delivery_app/src/Features/presentation/collections_page/View/collections_page.dart';
import 'package:delivery_app/src/Features/presentation/place_detail_page/View/place_detail_page.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static String welcomePath = 'welcome';
  static String tabsPath = 'tabs';
}

class MainCoordinator {
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator({
    FetchLocalStorageUseCase? fetchLocalStorageUseCase,
    ValidateCurrentUserUseCase? validateCurrentUserUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
  }) : _fetchLocalStorageUseCase =
           fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
       _validateCurrentUserUseCase =
           validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase(),
       _saveLocalStorageUseCase =
           saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  Future<String?> start() {
    return _isUserLogger().then((value) {
      return value == null ? RouterPath.welcomePath : RouterPath.tabsPath;
    });
  }

  Future<String?> _isUserLogger() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
      parameters: FetchLocalStorageUseCaseParameters(
        key: LocalStorageKeys.idToken,
      ),
    );
    var isUSerValid = idToken;
    userUid = idToken ?? "";
    return idToken;
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RouterPath.tabsPath);
  }

  showPopularPlacesListView({
    required BuildContext context,
    required List<PlaceListDetailEntity> popularPlaces,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            PopularPlacesListPage(popularPlaces: popularPlaces),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  showCollectionsPage({
    required BuildContext context,
    required List<CollectionDetailEntity> collections,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CollectionsPage(collections: collections),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  showCollectionsDetailPage({
    required BuildContext context,
    required CollectionDetailEntity collection,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CollectionDetailPage(
          viewmodel: DefaultCollectionDetailPageViewModel(
            collection: collection,
          ),
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  showPlaceDetailPage({
    required BuildContext context,
    required String placeId,
  }) async {
    
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(
      placeId: placeId,
    );

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => PlaceDetailPage(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }
}

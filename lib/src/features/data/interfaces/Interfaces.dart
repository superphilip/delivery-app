//Auth Repositories
import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:delivery_app/src/Features/data/Decodables/CollectionsDecodable/CollectionsDecodable.dart';
import 'package:delivery_app/src/Features/data/Decodables/User/UserDecodable.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/Features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:delivery_app/src/Features/data/Repositories/User/UserBodyParameters.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Managers/PlacesManager/Decodables/PlaceListDecodable.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/SignInDecodable.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/SignUpDecodable.dart';
import 'package:delivery_app/src/Services/FirebaseServices/AuthFirebaseServices/decodables/UpdatePasswordDecodable.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

//Auth Repositories
abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn({
    required SignInBodyParameters params,
  });
}

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp({
    required SignUpRepositoryParameters params,
  });
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({
    required String email,
  });
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({
    required GetUserDataBodyParameters parameters,
  });
}

//User Database Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({
    required Userbodyparameters parameters,
  });
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({
    required String localId,
  });
}

//Local Storage
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({required String key, required String value});
  Future<void> saveRecentSearchInLocalStorage({
    required String key,
    required List<String> value,
  });
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({required String key});
  Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}

abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory({
    required int categoryId,
  });
  Future<PlaceListDecodable> fetchPlacesListByQuery({required String query});
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({
    required List<String> placeIds,
  });
}

abstract class PlaceDetailRepository {
  Future<void> savePlaceDetail({required PlaceListDetailEntity placeDetail});
}

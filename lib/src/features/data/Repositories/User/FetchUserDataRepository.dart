import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/data/Decodables/User/UserDecodable.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "users/";
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository({
    RealtimeDatabaseService? realtimeDatabaseService,
  }) : _realtimeDatabaseService =
           realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({
    required String localId,
  }) async {
    var fullPath = Paths.path + localId;

    try {
      final result = await _realtimeDatabaseService.getData(path: fullPath);
      UserDecodable _decodable = UserDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}

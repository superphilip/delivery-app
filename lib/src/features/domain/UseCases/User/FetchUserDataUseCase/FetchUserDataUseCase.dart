import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery_app/src/Features/data/Repositories/User/FetchUserDataRepository.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

// abstract class FetchUserDataUseCase {
//   Future<Result<UserEntity, Failure>> execute({required String localId});
// }

// class DefaultFetchUserDataUseCase implements FetchUserDataUseCase {
//   final FetchUserDataRepository _fetchUserDataRepository;

//   DefaultFetchUserDataUseCase({
//     FetchUserDataRepository? fetchUserDataRepository,
//   }) : _fetchUserDataRepository =
//            fetchUserDataRepository ?? DefaultFetchUserDataRepository();

//   @override
//   Future<Result<UserEntity, Failure>> execute({required String localId}) {
//     return _fetchUserDataRepository.fetchUserData(localId: localId).then((
//       result,
//     ) {
//       switch (result.status) {
//         case ResultStatus.success:
//           if (result.value == null) {
//             return Result.failure(
//               Failure.fromMessage(
//                 message: AppFailureMessages.unExpectedErrorMessage,
//               ),
//             );
//           }

//           return Result.success(UserEntity.fromMap(result.value!.toMap()));
//         case ResultStatus.error:
//           return Result.failure(result.error);
//       }
//     });
//   }
// }

abstract class FetchUserDataUseCase {
  Future<UserEntity> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {

  // Dependencies
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({ FetchUserDataRepository? fetchUserDataRepository })
      : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<UserEntity> execute({ required String localId }) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  if(result.value == null) {
                    return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                  }
                  return UserEntity.fromMap(result.value!.toMap());
                case ResultStatus.error:
                  return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
              }
    });
  }
}
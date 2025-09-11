import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/LoadingStatusStateProvider.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity, Failure>?> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput
    with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({GoogleSignInUseCase? googleSignInUseCase})
    : _googleSignInUseCase =
          googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  void iniState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<UserEntity, Failure>?> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }
}

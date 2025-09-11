import 'package:delivery_app/src/Features/domain/UseCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignOutUseCase/SignOutUseCase.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';

abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;
  Future<void> signOut();
  void iniState({required LoadingStateProvider loadingState});
}

abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {
  final SignOutUseCase _signOutUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  @override
  DefaultProfileTabViewModel({
    SignOutUseCase? signOutUseCase,
    GoogleSignInUseCase? googleSignInUseCase,
  }) : _signOutUseCase = signOutUseCase ?? DefaultSignOutUseCase(),
       _googleSignInUseCase =
           googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  void iniState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStatusState.setLoadingState(isLoading: true);
    _googleSignInUseCase.signOutGoogleSesion();
    return _signOutUseCase.execute().then(
      (_) => loadingStatusState.setLoadingState(isLoading: false),
    );
  }
}

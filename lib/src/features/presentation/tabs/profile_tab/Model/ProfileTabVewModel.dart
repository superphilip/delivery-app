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

  DefaultProfileTabViewModel({SignOutUseCase? signOutUseCase})
    : _signOutUseCase = signOutUseCase ?? DefaultSignOutUseCase();

  @override
  void iniState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStatusState.setLoadingState(isLoading: true);
    return _signOutUseCase.execute().then(
      (_) => loadingStatusState.setLoadingState(isLoading: false),
    );
  }
}

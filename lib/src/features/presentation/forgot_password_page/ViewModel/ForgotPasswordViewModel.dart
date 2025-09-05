import 'package:delivery_app/src/Features/domain/UseCases/Auth/UpdatePasswordUseCase/UpdatePasswordUseCase.dart';

abstract class ForgotPasswordViewModelInput {
  late String email;
  Future<void> updatePassword();
}

abstract class ForgotPasswordViewModel extends ForgotPasswordViewModelInput {}

class DefaultForgotPasswordViewModel extends ForgotPasswordViewModel {
  final UpdatePasswordUseCase _updatePasswordUseCase;

  DefaultForgotPasswordViewModel({UpdatePasswordUseCase? updatePasswordUseCase})
    : _updatePasswordUseCase =
          updatePasswordUseCase ?? DefaultUpdatePasswordUseCase();

  @override
  Future<void> updatePassword() {
    return _updatePasswordUseCase.execute(email: email);
  }
}

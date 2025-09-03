import 'package:delivery_app/src/Features/data/Repositories/Auth/UpdatePassword/UpdatePasswordRepository.dart';
import 'package:delivery_app/src/Features/domain/interfaces/Interfaces.dart';

abstract class UpdatePasswordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {
  final UpdatePasswordRepository _updatePasswordRepository;
  
  DefaultUpdatePasswordUseCase({UpdatePasswordRepository? updatePasswordRepository})
      : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}

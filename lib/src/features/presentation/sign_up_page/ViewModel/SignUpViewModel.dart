import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Features/presentation/sign_up_page/Model/SignUpModel.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';

abstract class SignUpViewModelInput {
  late LoadingStateProvider loadingState = LoadingStateProvider();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController = TextEditingController();
  late DateTime selectedDate = DateTime.now();
  SignUpModel? signUpModel = SignUpModel();

  void iniState({required LoadingStateProvider loadingStateProvider});
  Future<Result<bool, Failure>> SignUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput with TextFormFieldDelegate {}

class DefaultSignUpViewModel extends SignUpViewModel {
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({
    SignUpUseCase? signUpUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
  }) : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
       _saveLocalStorageUseCase =
           saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  Future<Result<bool, Failure>> SignUp() {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase
        .execute(
          params: SignUpUseCaseParameters(
            username: signUpModel?.username ?? '',
            email: signUpModel?.email ?? '',
            password: signUpModel?.password ?? '',
            phone: signUpModel?.phone ?? '',
            date: signUpModel?.date ?? '',
          ),
        )
        .then((result) {
          switch (result.status) {
            case ResultStatus.success:
              _saveLocalStorageUseCase.execute(parameters: SaveLocalStorageUseCaseParameters(
                key: LocalStorageKeys.idToken,
                value: result.value?.idToken ?? ''
              ));
              loadingState.setLoadingState(isLoading: false);
              return Result.success(true);
            case ResultStatus.error:
              loadingState.setLoadingState(isLoading: false);
              return Result.failure(result.error);
          }
        });
  }

  @override
  void iniState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }
  
  @override
  onChanged({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break; 
    }
  }
}

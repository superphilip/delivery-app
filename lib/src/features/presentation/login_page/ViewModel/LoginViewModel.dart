import 'dart:core';

import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/CustomTextFormField.dart';
import 'package:delivery_app/src/Features/presentation/login_page/Model/LoginModel.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';

abstract class LoginViewModelInput {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  

  
  Future<Result<bool, Failure>> login({
    required String email,
    required String password,
  });
  bool isFormValidate();
}

abstract class LoginViewModel extends LoginViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultLoginViewModel({
    SignInUseCase? signInUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
  }) : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
       _saveLocalStorageUseCase =
           saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void iniState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> login({
    required String email,
    required String password,
  }) {
    loadingState.setLoadingState(isLoading: true);
    return _signInUseCase
        .execute(
          params: SignInUseCaseBodyParameters(email: email, password: password),
        )
        .then((result) {
          switch (result.status) {
            case ResultStatus.success:
              loadingState.setLoadingState(isLoading: false);
              _saveLocalStorageUseCase.execute(
                parameters: SaveLocalStorageUseCaseParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? "",
                ),
              );
              return Result.success(true);
            case ResultStatus.error:
              loadingState.setLoadingState(isLoading: false);
              return Result.failure(result.error);
          }
        });
  }

  @override
  onChanged({
    required String newValue,
    required CustomTextFormFieldType customTextFormFieldType,
  }) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
      case CustomTextFormFieldType.phone:
        throw UnimplementedError();
      case CustomTextFormFieldType.username:
        throw UnimplementedError();
      case CustomTextFormFieldType.dateOfBirth:
        throw UnimplementedError();
    }
  }
}

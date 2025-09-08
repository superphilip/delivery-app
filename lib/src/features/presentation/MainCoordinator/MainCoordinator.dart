import 'package:delivery_app/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery_app/src/Features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/Features/domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static String welcomePath = 'welcome';
  static String tabsPath = 'tabs';
}

class MainCoordinator {
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserUseCase;

  MainCoordinator({
    FetchLocalStorageUseCase? fetchLocalStorageUseCase,
    ValidateCurrentUserUseCase? validateCurrentUserUseCase,
  }) : _fetchLocalStorageUseCase =
           fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
       _validateCurrentUserUseCase =
           validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase();

  Future<String?> start() {
    return _isUserLogger().then((value) {
      return value == null ? RouterPath.welcomePath : RouterPath.tabsPath;
    });
  }

  Future<String?> _isUserLogger() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
      parameters: FetchLocalStorageUseCaseParameters(
        key: LocalStorageKeys.idToken,
      ),
    );
    var isUSerValid = idToken;
    return idToken;
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RouterPath.tabsPath);
  }
}

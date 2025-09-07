import 'package:delivery_app/src/Base/Views/LoadingView.dart';
import 'package:delivery_app/src/Features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:flutter/widgets.dart';

mixin BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = Loadingview();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

mixin BaseViewModel {
  late LoadingStateProvider loadingState = LoadingStateProvider();
  void iniState({required LoadingStateProvider loadingStateProvider});
}

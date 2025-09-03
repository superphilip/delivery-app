import 'package:delivery_app/src/Base/Views/LoadingView.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:flutter/widgets.dart';

mixin BaseView {
  final Widget loadingView = Loadingview();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

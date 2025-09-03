import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

mixin ErrorStateProviderDelegate {
  void setFailure({required BuildContext context, required Failure value});
}

class ErrorStateProvider extends ChangeNotifier
    with ErrorStateProviderDelegate {
  late Failure _failure;

  @override
  void setFailure({required BuildContext context, required Failure value}) {
    _failure = value;
    _showAlert(context: context, message: _failure.toString());
    notifyListeners();
  }

  void _showAlert({required BuildContext context, required String message}) {
    ErrorAlertView.showErrorAlertDialog(context: context, subTitle: message, ctaButtonAction: () {
      Navigator.of(context).pop(); 
    });
  }
}

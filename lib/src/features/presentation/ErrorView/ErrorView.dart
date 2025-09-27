import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/create_button.dart';
import 'package:delivery_app/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget with BaseView {
  bool isLocationDeniedError = false;
  String assetImagePath = "";
  String errorTitle = "";
  String errorSubTitle = "";

  ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    setErrorViewData();
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: getScreenHeight(context: context, multiplier: 0.1),
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(width: 216, height: 216, image: AssetImage(assetImagePath)),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  errorTitle,
                  style: TextStyle(
                    color: gris,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  errorSubTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: gris,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              createButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                color: orange,
                fontSize: 17,
                labelButton: isLocationDeniedError
                    ? "Establecer dirección de entrega"
                    : "Ir a inicio",
                func: () {
                  if (isLocationDeniedError) {
                  } else {
                    coordinator.showTabsPage(context: context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  setErrorViewData() {
    assetImagePath = isLocationDeniedError
        ? 'assets/location.png'
        : 'assets/errorIcon.png';
    errorTitle = isLocationDeniedError
        ? 'Location Denied Error'
        : 'Network Error';
    errorSubTitle = isLocationDeniedError
        ? 'Something bad happened, Without your current location, the app cannot continue to work properly. \n\n You can order anything, just indicate in which direction'
        : 'Something bad happened, the app cannot continue to work properly.';
  }
}

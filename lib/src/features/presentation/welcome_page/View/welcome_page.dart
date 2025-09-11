import 'dart:ui';

import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Features/presentation/welcome_page/ViewModel/WelcomePageViewModel.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {
  final WelcomePageViewModel _viewModel;

  _WelcomePageState({WelcomePageViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultWelcomePageViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.iniState(
      loadingStateProvider: Provider.of<LoadingStateProvider>(context),
    );

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: headerText(
                    'DELIVERED FAST FOOD TO YOUR DOOR',
                    Colors.white,
                    45,
                    FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 30.0,
                  ),
                  child: headerText(
                    'Set exact location to find the right restaurants near you.',
                    Colors.white,
                    17,
                    FontWeight.w400,
                  ),
                ),
                createButton(
                  color: orange,
                  marginText: EdgeInsets.only(left: 10),
                  fontSize: 15,
                  labelButton: 'Log in',
                  func: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),
                createButton(
                  image: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('assets/google.png'),
                  ),
                  color: Colors.white,
                  colortext: Colors.black,
                  marginText: EdgeInsets.only(left: 10),
                  fontSize: 15,
                  labelButton: 'Connect with google',
                  func: () => _signInWithGoogleTapped(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension UserActions on _WelcomePageState {
  _signInWithGoogleTapped(BuildContext context) {
    _viewModel.loadingState.setLoadingState(isLoading: true);
    _viewModel.signInWithGoogle().then((result) {
      switch (result?.status) {
        case ResultStatus.success:
          coordinator.showTabsPage(context: context);
        case ResultStatus.error:
          _viewModel.loadingState.setLoadingState(isLoading: false);
          if (result?.error == null) return;
          errorStateProvider.setFailure(context: context, value: result!.error!);
        case null:
          throw UnimplementedError();
      }
    });
  }
}

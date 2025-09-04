import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/login_page/ViewModel/LoginViewModel.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/Colors/colors.dart';

//Widgets
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

//UI
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BaseView {
  final LoginViewModel _viewModel;

  LoginPage({super.key, LoginViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.iniState(
      loadingState: Provider.of<LoadingStateProvider>(context),
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
    );

    return _viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image(
                              width: double.infinity,
                              height:
                                  (MediaQuery.of(context).size.height) - 500,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEMDd9&auto=format&fit=crop&w=500&q=60',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: backButton(context, Colors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, -20),
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Form(
                                  key: _viewModel.formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      headerText(
                                        'Welcome Back',
                                        primaryColor,
                                        30,
                                        FontWeight.bold,
                                      ),
                                      headerText(
                                        'Login to you account',
                                        gris,
                                        15,
                                        FontWeight.w500,
                                      ),
                                      CustomTextFormField(
                                        textFormFieldType:
                                            CustomTextFormFieldType.email,
                                        hintText: 'Email',
                                        delegate: _viewModel,
                                      ),
                                      CustomTextFormField(
                                        textFormFieldType:
                                            CustomTextFormFieldType.password,
                                        hintText: 'Password',
                                        delegate: _viewModel,
                                      ),
                                      createButton(
                                        margin: EdgeInsets.only(top: 30),
                                        color: orange,
                                        marginText: EdgeInsets.only(left: 10),
                                        fontSize: 15,
                                        labelButton: 'Log in',
                                        func: () => _ctaTapped(context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            'forgot-password',
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: headerText(
                                            'Forgot you password?',
                                            Colors.black,
                                            17,
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            headerText(
                                              "Don't have an account?",
                                              gris,
                                              15,
                                              FontWeight.w500,
                                            ),
                                            GestureDetector(
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                'sign-up',
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: headerText(
                                                  'Sign up',
                                                  orange,
                                                  15,
                                                  FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          );
  }
}

extension UserActions on LoginPage {
  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel
          .login(
            email: _viewModel.loginModel?.email ?? "",
            password: _viewModel.loginModel?.password ?? "",
          )
          .then((result) {
            switch (result.status) {
              case ResultStatus.success:
                Navigator.pushNamed(context, 'tabs');
              case ResultStatus.error:
                if (result.error != null) {
                  errorStateProvider.setFailure(
                    context: context,
                    value: result.error!,
                  );
                }
            }
          });
    }
  }
}

import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/tabs/TabsPage/View/tabs_page.dart';

import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';

//colors
import 'package:delivery_app/src/Colors/colors.dart';

//Widgets
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

//ViewModel
import 'package:delivery_app/src/Features/presentation/sign_up_page/ViewModel/SignUpViewModel.dart';

import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget with BaseView {
  final SignUpViewModel _viewModel;

  SignUpPage({super.key, SignUpViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.iniState(
      loadingStateProvider: Provider.of<LoadingStateProvider>(context),
    );
    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Builder(
                builder: (BuildContext context) {
                  return BackButtonView(color: Colors.black);
                },
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Center(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _viewModel.formKey,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              headerText(
                                'Create an account',
                                primaryColor,
                                30,
                                FontWeight.bold,
                              ),
                              SizedBox(height: 20),
                              CustomTextFormField(
                                textFormFieldType:
                                    CustomTextFormFieldType.username,
                                hintText: 'Username',
                                delegate: _viewModel,
                              ),
                              CustomTextFormField(
                                textFormFieldType:
                                    CustomTextFormFieldType.email,
                                hintText: 'Email',
                                delegate: _viewModel,
                              ),
                              CustomTextFormField(
                                textFormFieldType:
                                    CustomTextFormFieldType.phone,
                                hintText: 'Phone',
                                delegate: _viewModel,
                              ),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: CustomTextFormField(
                                    textFormFieldType:
                                        CustomTextFormFieldType.dateOfBirth,
                                    hintText: 'Date of Birth',
                                    delegate: _viewModel,
                                    controller: _viewModel.dateController,
                                  ),
                                ),
                              ),
                              CustomTextFormField(
                                textFormFieldType:
                                    CustomTextFormFieldType.password,
                                hintText: 'Password',
                                delegate: _viewModel,
                              ),
                              createButton(
                                margin: EdgeInsets.only(top: 30),
                                marginText: EdgeInsets.only(left: 10),
                                color: orange,
                                fontSize: 15,
                                labelButton: 'Sign up',
                                func: () {
                                  _ctaTapped(context);
                                },
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 40,
                                ),
                                child: headerText(
                                  'By clicking Sign up you agree to the following terms and Conditions without reservation',
                                  Colors.black,
                                  13,
                                  FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
  }
}

extension UserAction on SignUpPage {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _viewModel.selectedDate,
      firstDate: DateTime(1960, 1),
      lastDate: DateTime(2100),
      locale: Locale('es', ''),
    );
    if (picked != null && picked != _viewModel.selectedDate) {
      _viewModel.signUpModel?.date =
          "${picked.day}/${picked.month}/${picked.year}";
      _viewModel.dateController.text =
          "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel.SignUp().then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const TabsPage()),
              (Route<dynamic> route) => false,
            );
          case ResultStatus.error:
            errorStateProvider.setFailure(
              context: context,
              value: result.error!,
            );
        }
      });
    }
  }
}

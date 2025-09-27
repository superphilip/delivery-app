import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/presentation/ErrorView/ErrorView.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/Components/ExploreTabContentView.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:delivery_app/src/Services/GeolocationService/Service/GeolocationService.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with BaseView {
  final ExploreViewModel _viewModel;

  _ExploreTabState({ExploreViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultExploreViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: _viewModel.viewInitState(),
        builder:
            (
              BuildContext context,
              AsyncSnapshot<ExploreViewModelState> snapshot,
            ) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.error ==
                          GeoLocationFailureMessages
                              .locationPermissionsDenied ||
                      snapshot.error ==
                          GeoLocationFailureMessages
                              .locationPermissionsDeniedForever) {
                    var errorView = ErrorView();
                    errorView.isLocationDeniedError = true;
                    return errorView;
                  }
                  switch (snapshot.data) {
                    case ExploreViewModelState.viewLoadedState:
                      return ExploreTabContentView(viewModel: _viewModel);
                    default:
                      return ErrorView();
                  }
                default:
                  return loadingView;
              }
            },
      ),
    );
  }
}

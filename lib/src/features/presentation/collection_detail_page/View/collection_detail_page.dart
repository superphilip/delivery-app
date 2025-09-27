import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/presentation/ErrorView/ErrorView.dart';
import 'package:delivery_app/src/Features/presentation/collection_detail_page/View/Components/CollectionsDetailPageContentView.dart';
import 'package:delivery_app/src/Features/presentation/collection_detail_page/ViewModel/CollectionDetailPageViewModel.dart';
import 'package:flutter/material.dart';



class CollectionDetailPage extends StatelessWidget with BaseView {
  final CollectionDetailPageViewModel _viewModel;

  CollectionDetailPage({
    super.key,
    required CollectionDetailPageViewModel viewmodel,
  }) : _viewModel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _viewModel.viewInitState(),
        builder:
            (
              BuildContext context,
              AsyncSnapshot<CollectionDetailPageViewState> snapshot,
            ) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  switch (snapshot.data) {
                    case CollectionDetailPageViewState.viewLoadedState:
                      return CollectionsDetailPageContentView(
                        collection: _viewModel.getCollection(),
                        filteredPlacesByCategory:
                            _viewModel.filteredPlacesByCategory,
                      );
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

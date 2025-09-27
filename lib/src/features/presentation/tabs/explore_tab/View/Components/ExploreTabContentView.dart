import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/Components/CollectionsContentView.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/Components/NoveltyPlacesContentView.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/Components/PopularPlacesContentView.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/Components/SearchTopBar.dart';
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:flutter/material.dart';

class ExploreTabContentView extends StatelessWidget {
  final ExploreViewModel viewModel;

  const ExploreTabContentView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  SearchTopBar(),
                  NoveltyPlacesContentView(noveltyPlaces: viewModel.noveltyPlaces),
                  PopularPlacesContentView(popularPlaces: viewModel.popularPlaces),
                  SizedBox(height: 10),
                  CollectionsContentView(collections: viewModel.collections)
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}







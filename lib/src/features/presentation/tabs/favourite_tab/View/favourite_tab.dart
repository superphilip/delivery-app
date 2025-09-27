import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/ErrorView/ErrorView.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/tabs/favourite_tab/View/Components/FavoutireTabContentView.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab>
    with BaseView, FavouritePageChangeStateDelegate {
  @override
  Widget build(BuildContext context) {
    Provider.of<DefaultUserStateProvider>(context).favouritePageChangeStateDelegate = this;

    return Scaffold(
      backgroundColor: bgGreyPage,
      body: FutureBuilder(
        future: Provider.of<DefaultUserStateProvider>(context).fetchUserFavouritePlaces(),
        builder:
            (
              BuildContext context,
              AsyncSnapshot<List<PlaceListDetailEntity>> snapshot,
            ) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.hasError || !snapshot.hasData) {
                    return ErrorView();
                  }
                  if (snapshot.hasData) {
                  return FavoutireTabContentView(placeList:snapshot.data ?? []);
                } else {
                  return Container();
                }
                default:
                  return loadingView;
              }
            },
      ),
    );
  }

  @override
  placeFromFavouritesRemoved() {
   setState(() {});
  }
}

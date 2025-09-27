import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/UserStateProvider.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum PlaceListCarrouselStyle { list, listCards }

class PlaceListCarrousel extends StatelessWidget with BaseView {
  final List<PlaceListDetailEntity> placeList;
  final bool isShortedVisualization;
  final PlaceListCarrouselStyle carrouselStyle;

  PlaceListCarrousel({
    super.key,
    required this.placeList,
    required this.isShortedVisualization,
    required this.carrouselStyle,
  });

  @override
  Widget build(BuildContext context) {
    int itemCount = placeList.length > 3 ? 3 : placeList.length;
    int dinamycHeight = isShortedVisualization
        ? 120 * itemCount
        : 210 * placeList.length;

    return Container(
      alignment: Alignment.topCenter,
      height: dinamycHeight.toDouble(),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: isShortedVisualization ? itemCount : placeList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          switch (carrouselStyle) {
            case PlaceListCarrouselStyle.list:
              return PlaceListCardView(
                hasFreeDelivery: placeList[index].hasFreeDelivery,
                placeListDetailEntity: placeList[index],
              );
            case PlaceListCarrouselStyle.listCards:
              return FavouriteCardView(
                isFavourite: placeList[index].isUserFavourite(userUid: MainCoordinator.sharedInstance?.userUid),
                placeListDetailEntity: placeList[index],
                delegate: Provider.of<DefaultUserStateProvider>(context),
              );
          }
        },
      ),
    );
  }
}

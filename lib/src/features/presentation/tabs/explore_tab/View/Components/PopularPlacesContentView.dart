import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {
  List<PlaceListDetailEntity> popularPlaces = [];

  PopularPlacesContentView({super.key, required this.popularPlaces});

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty ? Container(height: 20)
    : Column(
      children: [
        GestureDetector(
          onTap: () => coordinator.showPopularPlacesListView(context: context, popularPlaces: popularPlaces),
          child: HeaderView(textHeader: 'Popular this week', textAction: 'Show all')),
        SizedBox(height: 15),
        PlaceListCarrousel(placeList: popularPlaces, isShortedVisualization: true, carrouselStyle: PlaceListCarrouselStyle.list)
      ],
    );
  }
}


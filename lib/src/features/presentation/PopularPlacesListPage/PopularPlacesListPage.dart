import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';

import 'package:flutter/material.dart';

class PopularPlacesListPage extends StatelessWidget {
  List<PlaceListDetailEntity> popularPlaces = [];

  PopularPlacesListPage({super.key, required this.popularPlaces});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: BackButtonView(color: Colors.black)
      ),
      body: Container(
        width: getScreenWidth(context: context, multiplier: 1.5),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                PlaceListCarrousel(placeList: popularPlaces, isShortedVisualization: false, carrouselStyle: PlaceListCarrouselStyle.list)
              ]
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class FavoutireTabContentView extends StatelessWidget {
  List<PlaceListDetailEntity> placeList;

  FavoutireTabContentView({super.key, required this.placeList});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leading: Text(''),
          backgroundColor: white,
          title: headerText('My favourites', primaryColor, 17, FontWeight.w600),
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PlaceListCarrousel(placeList: placeList, isShortedVisualization: false, carrouselStyle: PlaceListCarrouselStyle.listCards),
            ),
          ]),
        ),
      ],
    );
  }
}

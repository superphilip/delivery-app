import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';

class CollectionsDetailPageContentView extends StatelessWidget {
  CollectionDetailEntity collection;
  List<PlaceListDetailEntity> filteredPlacesByCategory;

  CollectionsDetailPageContentView({
    super.key,
    required this.collection,
    required this.filteredPlacesByCategory,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: getScreenHeight(context: context, multiplier: 0.2),
          backgroundColor: orange,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: getScreenHeight(context: context, multiplier: 0.3),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    collection.img,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Center(
                  child: headerText(
                    collection.name,
                    Colors.white,
                    35,
                    FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return BackButtonView(color: Colors.white);
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: headerText(
                      "${filteredPlacesByCategory.length} places",
                      Color.fromRGBO(51, 58, 77, 0.8),
                      17,
                      FontWeight.w600,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -55),
                    child: PlaceListCarrousel(
                      placeList: filteredPlacesByCategory, 
                      isShortedVisualization: false, 
                      carrouselStyle: PlaceListCarrouselStyle.listCards
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

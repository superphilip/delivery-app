import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class NoveltyPlacesContentView extends StatelessWidget {
  List<PlaceListDetailEntity> noveltyPlaces = [];

  NoveltyPlacesContentView({super.key, required this.noveltyPlaces});

  @override
  Widget build(BuildContext context) {
    return noveltyPlaces.isEmpty
        ? Container(height: 20)
        : Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerLeft,
                child: headerText(
                  'Discover new places',
                  Colors.black,
                  30,
                  FontWeight.bold,
                ),
              ),
              VerticalCardsCarrousel(placeList: noveltyPlaces)
            ],
          );
  }
}

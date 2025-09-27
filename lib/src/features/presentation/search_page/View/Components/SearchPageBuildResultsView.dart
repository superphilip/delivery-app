import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class SearchPageBuildResultsView extends StatefulWidget {
  List<PlaceListDetailEntity> places = [];

  SearchPageBuildResultsView({super.key, required this.places});

  @override
  State<SearchPageBuildResultsView> createState() =>
      _SearchpagebuildresultsviewState();
}

class _SearchpagebuildresultsviewState
    extends State<SearchPageBuildResultsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    DoubleTextView(textHeader: 'Resultados', textAction: ''),
                    SizedBox(height: 20),
                    PlaceListCarrousel(placeList: widget.places, isShortedVisualization: false, carrouselStyle: PlaceListCarrouselStyle.list)
                  ],
                ),
              )
            ]
          )
        )
      ],
    );
  }
}

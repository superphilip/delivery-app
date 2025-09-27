import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class CollectionsContentView extends StatelessWidget with BaseView {
  List<CollectionDetailEntity> collections = [];

  CollectionsContentView({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    return collections.isEmpty
        ? Container(height: 10)
        : Column(
            children: [
              GestureDetector(
                onTap: () {
                  coordinator.showCollectionsPage(
                    context: context,
                    collections: collections,
                  );
                },
                child: HeaderView(
                  textHeader: 'Colections',
                  textAction: 'Show all',
                ),
              ),
              CollectionsCarrouselView(collections: collections),
            ],
          );
  }
}

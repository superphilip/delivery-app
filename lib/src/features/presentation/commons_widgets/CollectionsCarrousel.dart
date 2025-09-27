import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:flutter/material.dart';

class CollectionsCarrouselView extends StatelessWidget{
  List<CollectionDetailEntity> collections = [];

  CollectionsCarrouselView({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: collections.length < 5 ? collections.length : 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CollectionsCarrouselCardView(collection: collections[index]);
        },
      ),
    );
  }
}

class CollectionsCarrouselCardView extends StatelessWidget with BaseView {
  CollectionDetailEntity collection;

  CollectionsCarrouselCardView({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => coordinator.showCollectionsDetailPage(context: context, collection: collection),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(collection.img),
                  ),
                ),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black45
                  ),
                  child: Center(
                    child: Text(
                      collection.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

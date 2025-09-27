import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/back_button.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/header_text.dart';
import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  List<CollectionDetailEntity> collections;

  CollectionsPage({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: headerText('Collections', primaryColor, 17, FontWeight.bold),
            leading: Builder(
              builder: (BuildContext context) {
                return BackButtonView(color: Colors.black);
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((ctx, index) {
                return CollectionGridCardView(collection: collections[index]);
              }, childCount: collections.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionGridCardView extends StatelessWidget with BaseView {
  CollectionDetailEntity collection;
  CollectionGridCardView({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => coordinator.showCollectionsDetailPage(context: context, collection: collection),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: 165,
              height: 190,
              fit: BoxFit.cover,
              image: NetworkImage(
                collection.img,
              ),
            ),
          ),
          Container(
            width: 165,
            height: 190,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Center(
            child: headerText(collection.name, Colors.white, 18, FontWeight.bold),
          )
        ],
      ),
    );
  }
}

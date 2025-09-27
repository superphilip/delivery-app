import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
// import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class VerticalCardsCarrousel extends StatelessWidget {
  final List<PlaceListDetailEntity> placeList;

  const VerticalCardsCarrousel({super.key, required this.placeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: placeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return VerticalCardView(placeListDetailEntity: placeList[index]);
        },
      ),
    );
  }
}

class VerticalCardView extends StatelessWidget with BaseView {
  PlaceListDetailEntity placeListDetailEntity;

  VerticalCardView({super.key, required this.placeListDetailEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => coordinator.showPlaceDetailPage(context: context, placeId: placeListDetailEntity.placeId),
      child: Container(
        width: 210,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: 210,
                height: 240,
                fit: BoxFit.cover,
                image: NetworkImage(placeListDetailEntity.imgs.first),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    placeListDetailEntity.placeName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    placeListDetailEntity.address,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: amarillo, size: 16),
                    Text(
                      "${placeListDetailEntity.ratingAverage}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "(${placeListDetailEntity.ratings} ratings)",
                      style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    // createButton(
                    //   width: 90,
                    //   height: 18,
                    //   margin: EdgeInsets.symmetric(horizontal: 5),
                    //   color: orange,
                    //   elevation: 0.5,
                    //   marginText: EdgeInsets.only(left: 0),
                    //   fontSize: 11,
                    //   labelButton: 'Delivery',
                    //   func: () => print('hola'),
                    // ),5
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

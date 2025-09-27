import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:flutter/material.dart';

class RecentSearchCarrouselView extends StatelessWidget {
  final List<PlaceListDetailEntity> placeList;

  const RecentSearchCarrouselView({super.key, required this.placeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 240,
      child: ListView.builder(
        itemCount: placeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return RecentSearchVerticalCardView(
            placeListDetailEntity: placeList[index],
          );
        },
      ),
    );
  }
}

class RecentSearchVerticalCardView extends StatelessWidget {
  final PlaceListDetailEntity placeListDetailEntity;

  const RecentSearchVerticalCardView({super.key, required this.placeListDetailEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      margin: EdgeInsets.only(top: 10, right: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 160,
              height: 120,
              fit: BoxFit.cover,
              image: NetworkImage(placeListDetailEntity.imgs.first)
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  placeListDetailEntity.placeName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  placeListDetailEntity.address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: gris,
                    fontWeight: FontWeight.w400,
                    fontSize: 17
                  ),
                ),
              ),
              Container(
                width: 160,
                margin: EdgeInsets.only(top:5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: amarillo, size: 16),
                    Text(
                      "${placeListDetailEntity.ratingAverage}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${placeListDetailEntity.ratings} ratings",
                      style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

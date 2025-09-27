import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

mixin FavouritesCardViewDelegate {
  favouriteIconTapped(bool isTapped, String placeId);
}

class FavouriteCardView extends StatefulWidget {
  bool isFavourite;
  final PlaceListDetailEntity placeListDetailEntity;
  final FavouritesCardViewDelegate? delegate;

  FavouriteCardView({
    super.key,
    required this.isFavourite,
    required this.placeListDetailEntity,
    this.delegate,
  });

  @override
  State<FavouriteCardView> createState() => _FavouriteCardViewState();
}

class _FavouriteCardViewState extends State<FavouriteCardView> with BaseView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => coordinator.showPlaceDetailPage(
        context: context,
        placeId: widget.placeListDetailEntity.placeId,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 16),
        height: 125,
        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
        decoration: createBoxDecorationWithShadows(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18),
              child: ClipRRect(
                child: Image(
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.placeListDetailEntity.imgs.first),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      widget.placeListDetailEntity.placeName,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      widget.placeListDetailEntity.address,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-5, 0),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: amarillo, size: 16),
                        headerText(
                          "${widget.placeListDetailEntity.ratingAverage}",
                          Colors.black,
                          13,
                          FontWeight.w500,
                        ),
                        headerText(
                          "${widget.placeListDetailEntity.ratings} ratings",
                          gris,
                          13,
                          FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isFavourite = !widget.isFavourite;
                    widget.delegate?.favouriteIconTapped(
                      widget.isFavourite,
                      widget.placeListDetailEntity.placeId,
                    );
                  });
                },
                icon: Icon(
                  Icons.bookmark,
                  size: 35,
                  color: widget.isFavourite ? rosa : Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

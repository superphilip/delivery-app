import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

Widget favouritesCard({
  BuildContext? context,
  double marginTop = 15.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 0.0,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
  required String review,
  required String ratings,
  String buttonText = '',
  bool? hasActionButton,
  bool isFavourite = true,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: marginTop,
      right: marginRight,
      bottom: marginBottom,
      left: marginLeft
    ),
    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: double.infinity,
    decoration: createBoxDecorationWithShadows(),
    child: Wrap(
      children: [
        ClipRRect(
          child: Image(
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            image: image
          )
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7.0),
                    child: headerText(title, Colors.black, 17, FontWeight.bold)),
                  SizedBox(width: 10.0),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.bookmark, size: 35.0, color: isFavourite ? rosa : Colors.grey[300],)
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: headerText(subtitle, gris, 13.0, FontWeight.w500)),
              Wrap(
                children: [
                  Icon(Icons.star, color: amarillo, size: 16),
                  headerText(review, primaryColor, 13.0, FontWeight.w500),
                  headerText(ratings, gris, 13.0, FontWeight.w500),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    width: 90.0,
                    height: 20.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        shape: StadiumBorder(),
                        backgroundColor: orange,
                      ),
                      child: headerText(buttonText, Colors.white, 10.5, FontWeight.bold)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}






// Widget favouritesCard({
//   required ImageProvider<Object> image,
//   required String title,
//   required String subtitle,
//   required String review,
//   required String ratings,
//   String? buttonText,
//   bool isFavourite = true
// }) {
//   return Card(
//     margin: EdgeInsets.only(top: 15),
    
//     color: Colors.white,
//     elevation: 5.0, // Controls the shadow depth
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0), // Rounded corners
//     ),
//      // Margin around the card
//     child: Container(
//       width: double.infinity,
//       padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min, // Shrink to fit content
//         children: <Widget>[
//           ClipRRect(
//             child: Image(
//               width: 90,
//               height: 90,
//               image: image
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 7.0),
//                       child: headerText(title, Colors.black, 17.0, FontWeight.bold)),
//                     SizedBox(width: 10),
//                     IconButton(
//                       onPressed: () {}, 
//                       icon: Icon(Icons.bookmark, size: 35.0, color: isFavourite ? rosa : Colors.grey[300],)
//                     )
//                   ],
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.only(bottom: 5),
//                   child: headerText(subtitle, gris, 13.0, FontWeight.w500)),
//                 Wrap(
//                   children: [
//                     Icon(Icons.star, color: amarillo, size: 16),
//                     headerText(review, primaryColor, 13.0, FontWeight.w500),
//                     headerText(ratings, gris, 13.0, FontWeight.w500),
//                     SingleChildScrollView(
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 15.0),
//                         width: 75.5,
//                         height: 18,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             elevation: 0.5,
//                             shape: StadiumBorder(),
//                             backgroundColor: orange,
//                           ), 
//                           child: Expanded(child: headerText(buttonText ?? '', Colors.white, 7.2, FontWeight.bold))
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
          
//         ],
//       ),
      
//     ),
//   );
// }

import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/search_page/View/search_page.dart';
import 'package:delivery_app/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => {
            showSearch(context: context, delegate: SearchPage())
          },
          child: Container(
            width: getScreenWidth(context: context, multiplier: 0.93),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 20, color: gris),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    'Search',
                    style: TextStyle(color: gris, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


/*
   Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () => Navigator.pushNamed(context, 'filter'),
            icon: Icon(Icons.filter_list, size: 25, color: Colors.white),
          ),
        ),

*/ 
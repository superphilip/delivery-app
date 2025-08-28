import 'package:flutter/material.dart';

//colors
import 'package:delivery_app/src/colors/colors.dart';

import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    _topBar(context),
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
                    _sliderCards(),
                    _headers(context, 'Popular this week', 'Show all'),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      title: "Andy & Cindy's Diner", 
                      subtitle: '87 Botsford Circle apt', 
                      review: '4.8', 
                      ratings: '(233 ratings)',
                      button:  createButton(
                        width: 110,
                        height: 18,
                        margin: EdgeInsets.only(left: 35),
                        color: orange,
                        elevation: 0.5,
                        fontSize: 10.5,
                        labelButton: 'Free Delivery',
                        func: () => print('hola'),
                      ),
                    ),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      title: "Andy & Cindy's Diner", 
                      subtitle: '87 Botsford Circle apt', 
                      review: '4.8', 
                      ratings: '(233 ratings)',
                      button:  createButton(
                        width: 110,
                        height: 18,
                        margin: EdgeInsets.only(left: 35),
                        color: orange,
                        elevation: 0.5,
                        fontSize: 10.5,
                        labelButton: 'Free Delivery',
                        func: () => print('hola'),
                      ),
                    ),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      title: "Andy & Cindy's Diner", 
                      subtitle: '87 Botsford Circle apt', 
                      review: '4.8', 
                      ratings: '(233 ratings)',
                      button:  createButton(
                        width: 110,
                        height: 18,
                        margin: EdgeInsets.only(left: 35),
                        color: orange,
                        elevation: 0.5,
                        fontSize: 10.5,
                        labelButton: 'Free Delivery',
                        func: () => print('hola'),
                      ),
                    ),
                    SizedBox(height: 10),
                    _headers(context, 'Colections', 'Show all'),
                    _sliderCollections(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 300,
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
    ],
  );
}

Widget _sliderCards() {
  return Container(
    height: 350,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _tarjeta(context);
      },
    ),
  );
}

Widget _tarjeta(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, 'place-detail'),
    child: Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 210,
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Andy & Cindy's Diner",
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
                  "87 Botsford Circle Apt",
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
                    '4.8',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '(233 ratings)',
                    style: TextStyle(
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  createButton(width: 90, height: 18, margin: EdgeInsets.symmetric(horizontal: 5), color: orange, elevation: 0.5, marginText:  EdgeInsets.only(left: 0),  fontSize: 11, labelButton: 'Delivery', func: () => print('hola')),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(textHeader, Colors.black, 20, FontWeight.bold),
      ),
      Spacer(),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'collections'),
        child: Row(
          children: [
            Text(
              textAction,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Icon(Icons.play_arrow),
          ],
        ),
      ),
    ],
  );
}



Widget _sliderCollections() {
  return Container(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _tarjetaCollection(context);
      },
    ),
  );
}

Widget _tarjetaCollection(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1498837167922-ddd27525d352?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
        ),
      ],
    ),
  );
}

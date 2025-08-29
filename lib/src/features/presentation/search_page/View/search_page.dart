import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/Colors/colors.dart';

//Widgets
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, color: Colors.black, size: 40),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: headerText(
                        'Search',
                        primaryColor,
                        30,
                        FontWeight.bold,
                      ),
                    ),
                    _searchInput(context),
                    SizedBox(height: 40),
                    headerDoubleText(
                      textHeader: 'Recent search',
                      textAction: 'Clear All',
                    ),
                    _sliderRecentSearch(),
                    SizedBox(height: 20),
                    headerDoubleText(
                      textHeader: 'Recommend for you',
                      textAction: '',
                    ),
                    SizedBox(height: 20),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      image: Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1599&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      title: 'Kellys Cafe and Expreso',
                      subtitle: '882 Swift courts Apt. 918',
                      review: '4.8',
                      ratings: '(233 ratings)',
                    ),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      image: Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1599&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      title: 'Kellys Cafe and Expreso',
                      subtitle: '882 Swift courts Apt. 918',
                      review: '4.8',
                      ratings: '(233 ratings)',
                    ),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      image: Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1599&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      title: 'Kellys Cafe and Expreso',
                      subtitle: '882 Swift courts Apt. 918',
                      review: '4.8',
                      ratings: '(233 ratings)',
                    ),
                    popularesCard(
                      context: context,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      image: Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1599&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      title: 'Kellys Cafe and Expreso',
                      subtitle: '882 Swift courts Apt. 918',
                      review: '4.8',
                      ratings: '(233 ratings)',
                    ),
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

Widget _searchInput(BuildContext context) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5),
        prefixIcon: Icon(Icons.search, color: gris),
        hintText: 'Search',
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}

Widget _sliderRecentSearch() {
  return Container(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return card(
          context: context,
          headtitle: headerText(
            "Andy & Cindy's Diner",
            primaryColor,
            17,
            FontWeight.w500,
          ),
          headsubtitle: headerText(
            '87 Botsford Circle Apt',
            gris,
            13,
            FontWeight.w400,
          ),
        );
      },
    ),
  );
}

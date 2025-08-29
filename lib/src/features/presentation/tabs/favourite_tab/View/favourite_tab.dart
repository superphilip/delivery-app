import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: Text(''),
            backgroundColor: white,
            title: headerText('My favourites', primaryColor, 17, FontWeight.w600),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      favouritesCard(
                          image: NetworkImage('https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          title: "Andy &Cindy's Diner",
                          subtitle: "87 Botsford Circle Apt",
                          review: "4.8",
                          ratings: "(233 ratings)",
                          isFavourite: true,
                          buttonText: 'Delivery',    
                        ),
                        favouritesCard(
                          image: NetworkImage('https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          title: "Andy &Cindy's Diner",
                          subtitle: "87 Botsford Circle Apt",
                          review: "4.8",
                          ratings: "(233 ratings)",
                          isFavourite: false,
                          buttonText: 'Delivery'
                        ),
                        favouritesCard(
                          image: NetworkImage('https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          title: "Andy &Cindy's Diner",
                          subtitle: "87 Botsford Circle Apt",
                          review: "4.8",
                          ratings: "(233 ratings)",
                          isFavourite: false,
                          buttonText: 'Delivery'
                        ),
                        favouritesCard(
                          image: NetworkImage('https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          title: "Andy &Cindy's Diner",
                          subtitle: "87 Botsford Circle Apt",
                          review: "4.8",
                          ratings: "(233 ratings)",
                          isFavourite: false,
                          buttonText: 'Delivery'
                        ),
                        favouritesCard(
                          image: NetworkImage('https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          title: "Andy &Cindy's Diner",
                          subtitle: "87 Botsford Circle Apt",
                          review: "4.8",
                          ratings: "(233 ratings)",
                          isFavourite: false,
                          buttonText: 'Delivery'
                        ),
                    ],
                  ),
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}
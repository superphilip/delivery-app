import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230,
            backgroundColor: orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1669261881937-05337dde82df?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Center(
                    child: headerText(
                      'Asia \n Restaurant',
                      Colors.white,
                      35,
                      FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return backButton(context, Colors.white);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: headerText(
                        '128 places',
                        Color.fromRGBO(51, 58, 77, 0.8),
                        17,
                        FontWeight.w600,
                      ),
                    ),
                    Column(
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

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/back_button.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/header_text.dart';
import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

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
                return backButton(context, Colors.black);
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 20),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, 'collections-detail'),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            width: 165,
            height: 190,
            fit: BoxFit.cover,
            image: NetworkImage('https://plus.unsplash.com/premium_photo-1669261881937-05337dde82df?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
          ),
        ),
        Container(
          width: 165,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 35, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              headerText('Asia', Colors.white, 18, FontWeight.bold),
              headerText('128 places', Colors.white, 15, FontWeight.w300),
            ],
          ),
        )
      ],
    ),
  );
}

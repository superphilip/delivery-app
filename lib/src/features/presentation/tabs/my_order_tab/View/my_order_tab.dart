import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/features/presentation/tabs/my_order_tab/View/components/empty_order_view.dart';
import 'package:flutter/material.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({super.key});

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: emptyOrderState
          ? EmptyOrderView()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  elevation: 0.5,
                  leading: Text(''),
                  backgroundColor: white,
                  title: headerText(
                    'My Order',
                    primaryColor,
                    17,
                    FontWeight.w600,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [_orders(context),SizedBox(height: 30,), _checkoutResume(context)],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
    );
  }
}

Widget _orders(BuildContext context) {
  return Column(children: [_cardsOrdes(context)]);
}

Widget _cardsOrdes(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    margin: EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(248, 248, 248, 0.6),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(children: [_cardOrderTopContent()]),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context),
          ],
        ),
        _moreContent(context),
      ],
    ),
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 7, bottom: 7, right: 20),
          child: headerText(
            'Little Creatures - Club Street',
            primaryColor,
            20,
            FontWeight.bold,
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: gris, size: 16),
              headerText('87 Botsford Circle Apt', gris, 14, FontWeight.w500),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 110,
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: orange),
                  child: headerText('Delivery', white, 11, FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
    ),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText('Special Gajanand Bhel', orange, 15, FontWeight.w300),
          headerText(
            'Mixed vegetables, Chicken Egg',
            gris,
            12,
            FontWeight.w300,
          ),
        ],
      ),
      trailing: headerText('17.20 €', gris, 15, FontWeight.w300),
    ),
  );
}

Widget _moreContent(BuildContext context) {
  return Container(
    child: ListTile(
      title: headerText('Add more items', rosa, 17, FontWeight.w600),
    ),
  );
}

Widget _checkoutResume(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0,
        ),
      ],
    ),
    child: Column(
      children: [
        _itemsCheckOutResume(
          context: context,
          title: 'Subtotal',
          value: '93.40 €',
        ),
        _itemsCheckOutResume(
          context: context,
          title: 'Tax & Fee',
          value: '3.00 €',
        ),
        _itemsCheckOutResume(
          context: context,
          title: 'Delivery',
          value: 'Free',
        ),
        _buttonCheckout(context),
      ],
    ),
  );
}

Widget _itemsCheckOutResume({
  required BuildContext context,
  required String title,
  required String value,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
    ),
    child: ListTile(
      title: headerText(title, primaryColor, 15, FontWeight.w400),
      trailing: headerText(value, primaryColor, 15, FontWeight.w500),
    ),
  );
}

Widget _buttonCheckout(context) {
  return Container(
    width: double.infinity,
    height: 45,
    margin: EdgeInsets.only(top: 10),
    child: ElevatedButton(
      onPressed: () {}, 
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        backgroundColor: orange
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: EdgeInsets.only(left: 50),
            child: headerText('Pedir', white, 17, FontWeight.bold),
          ),
          Container(
            child: headerText('95.49 €', white, 15, FontWeight.bold),
          ),
        ],
      )
    ),
  );
}

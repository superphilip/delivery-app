import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  //MediaQuery.sizeOf(context).height para manejar reponsive
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        label: headerText(
          'Añadir a la cesta 95.40 €',
          Colors.white,
          17.0,
          FontWeight.w600,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: 395,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1459789034005-ba29c5783491?q=80&w=1538&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                    width: double.infinity,
                    height: 350,
                  ),
                  Wrap(
                    children: [
                      _promoButton(),
                      _infoPlace(),
                      _infoPlaceStats(),
                      offerBanner(),
                    ],
                  ),
                ],
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return BackButtonView(color: Colors.white);
              },
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(10),
                child: Image(
                  width: 28,
                  height: 28,
                  image: AssetImage('assets/share.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _headers(texto: 'Populars '),
              _sliderCards(),
              _headers(texto: 'Full Menu'),
              _menuList(context),
              _reviews(),
              _headers(texto: 'Your Rating'),
              _yourRating(),
              SizedBox(height: 150.0),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _promoButton() {
  return Container(
    margin: EdgeInsets.only(top: 121.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 25,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: orange),
          child: headerText('Free Delivery', Colors.white, 12, FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.symmetric(vertical: 7),
        child: headerText(
          'Boon Lay Ho Huat Fried Prawn Noodle',
          Colors.white,
          30.0,
          FontWeight.bold,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Icon(Icons.location_on, color: gris),
            headerText(
              '03 Jameson Manors Apt. 177',
              gris,
              15.0,
              FontWeight.w500,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _infoPlaceStats() {
  return Container(
    margin: EdgeInsets.only(top: 26.0),
    padding: EdgeInsets.symmetric(horizontal: 40.0),
    height: 55.0,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 19),
                headerText('4.5', Colors.white, 15.0, FontWeight.bold),
              ],
            ),
            headerText('351 Ratings', gris, 15.0, FontWeight.w500),
          ],
        ),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bookmark, color: Colors.white, size: 19),
                headerText('137k', Colors.white, 15.0, FontWeight.bold),
              ],
            ),
            headerText('Favourites', gris, 15.0, FontWeight.w500),
          ],
        ),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.photo, color: Colors.white, size: 19),
                headerText('345', Colors.white, 15.0, FontWeight.bold),
              ],
            ),
            headerText('Photos', gris, 15.0, FontWeight.w500),
          ],
        ),
      ],
    ),
  );
}

Widget offerBanner() {
  return Container(
    color: Color.fromRGBO(255, 237, 214, 1.0),
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
    height: 90,
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText('New! Try Pickup', orange, 15.0, FontWeight.bold),
            headerText(
              'Pickup on your time. Your order is \n ready when you are.',
              primaryColor,
              13.0,
              FontWeight.w400,
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: headerText('Order now', Colors.white, 13.0, FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _headers({required String texto}) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 5.0),
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: DoubleTextView(textHeader: texto, textAction: '')
  );
}

Widget _sliderCards() {
  return Container(
    height: 210.0,
    padding: EdgeInsets.only(left: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext _, int index) {
        return _cards();
      },
    ),
  );
}

Widget _cards() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            width: 200.0,
            height: 100.0,
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://images.unsplash.com/photo-1581347996218-69c7abe63a65?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: headerText(
            'Peanut Chaat with Dahi',
            primaryColor,
            15.0,
            FontWeight.bold,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: headerText('9.50 €', gris, 14.0, FontWeight.w500),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: headerText('Selecciona', orange, 15.0, FontWeight.w500),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 90),
              child: Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/plus_order.png'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '6'),
        _menuItem(context, 'Vegetables', '7'),
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: gris)),
    ),
    child: Column(
      children: [
        ListTile(
          title: headerText(texto, primaryColor, 17.0, FontWeight.w300),
          trailing: headerText(itemCount, primaryColor, 17.0, FontWeight.w300),
        ),
        _sliderCards(),
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 135,
    padding: EdgeInsets.only(left: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _cardReviews();
      },
    ),
  );
}

Widget _cardReviews() {
  var lorem =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.";

  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 1, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                width: 49.0,
                height: 43.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1612724880140-e7456ea477b6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwa,G90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerText(
                    'Mike Smithson',
                    primaryColor,
                    14,
                    FontWeight.bold,
                  ),
                  headerText('45 Reviews', gris, 12, FontWeight.w500),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('4', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: headerText(
            lorem,
            gris,
            12,
            FontWeight.w500,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: headerText('See full review', orange, 15, FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget _yourRating() {
  var lorem =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.";
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('1', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('2', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('3', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('4', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText('5', Colors.white, 12, FontWeight.w400),
                      Icon(Icons.star, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: headerText(
            lorem,
            gris,
            12,
            FontWeight.w400,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 20),
          child: headerText('+ Edit your review', orange, 15, FontWeight.w500),
        ),
      ],
    ),
  );
}

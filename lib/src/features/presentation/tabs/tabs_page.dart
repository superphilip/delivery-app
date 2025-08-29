import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

//tabs
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/profile_tab/View/profile_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pedirLocation(context);
    });
  }

  final List<Widget> _widgetPtions = [
    ExploreTab(),
    MyOrderTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetPtions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _cambiarWidget,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'My Order',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profile'),
      ],
    );
  }
}

Future _pedirLocation(BuildContext context) async {
  await showAlertDialog(
    context,
    Image(
      width: 130, 
      height: 130,
      image: AssetImage('assets/location.png')
    ),
    'Enabled Your Location',
    'Please allow to use your location to show nearby restaurant on the map.',
    createButton(margin: EdgeInsets.only(top: 40), color: orange, marginText: EdgeInsets.only(left: 10), fontSize: 15, labelButton: 'Enable Location', func: () => Navigator.pop(context))
  );
}


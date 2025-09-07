import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Features/presentation/tabs/TabsPage/ViewModel/TabsPageViewModel.dart';
import 'package:delivery_app/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';

//tabs
import 'package:delivery_app/src/Features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:delivery_app/src/Features/presentation/tabs/profile_tab/View/profile_tab.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {
  final TabsPageViewModel _viewModel;

  _TabsPageState({TabsPageViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultTabsPageViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _viewModel.loadingState.setLoadingState(isLoading: true);
      final currentStatus = await _viewModel.getPermissionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
        default:
          _viewModel.loadingState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  final List<Widget> _widgetPtions = [
    ExploreTab(),
    MyOrderTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    _viewModel.iniState(
      loadingStateProvider: Provider.of<LoadingStateProvider>(context),
    );

    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            body: _widgetPtions.elementAt(_selectedItemIndex),
            bottomNavigationBar: _bottomNavigationBar(context),
          );
  }
}

extension PrivateMethods on _TabsPageState {
  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _changeTab,
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

  Future _getCurrentPosition(BuildContext context) async {
    await showAlertDialog(
      context,
      Image(width: 130, height: 130, image: AssetImage('assets/location.png')),
      'Enabled Your Location',
      'Please allow to use your location to show nearby restaurant on the map.',
      createButton(
        margin: EdgeInsets.only(top: 40),
        color: orange,
        marginText: EdgeInsets.only(left: 10),
        fontSize: 15,
        labelButton: 'Enable Location',
        func: () {
          _closeAlertDialog(context);
          _viewModel.getCurrentPosition().then((result) {
            switch (result.status) {
              case ResultStatus.success:
                _viewModel.loadingState.setLoadingState(isLoading: false);
              case ResultStatus.error:
                errorStateProvider.setFailure(
                  context: context,
                  value: result.error!,
                );
            }
          });
        },
      ),
    );
  }

  _closeAlertDialog(BuildContext context) {
    _viewModel.loadingState.setLoadingState(isLoading: false);
    Navigator.pop(context);
  }
}

extension UserActions on _TabsPageState {
  void _changeTab(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}

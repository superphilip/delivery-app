import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/LoadingStatusStateProvider.dart';

import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';

import 'package:delivery_app/src/Features/presentation/tabs/profile_tab/Model/ProfileTabVewModel.dart';
import 'package:delivery_app/src/Features/presentation/welcome_page/View/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final ProfileTabViewModel _viewModel;

  _ProfileTabState({ProfileTabViewModel? profileTabViewModel})
    : _viewModel = profileTabViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.iniState(
      loadingState: Provider.of<LoadingStateProvider>(context),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(children: [_header(context), _contentProfile(context)]),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'profile-detail'),
      child: Container(
        height: 220,
        color: bgGreyPage,
        padding: EdgeInsets.all(40),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              radius: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      headerText(
                        'Cameron Cook',
                        primaryColor,
                        20,
                        FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, color: gris),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rosa,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image(
                          width: 16,
                          height: 16,
                          image: AssetImage('assets/crown.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: headerText(
                            'VIP Member',
                            white,
                            11,
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/noti.png'),
            ),
            title: headerText(
              'Notifications',
              primaryColor,
              15,
              FontWeight.w400,
            ),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/payicon.png'),
            ),
            title: headerText(
              'Payment methods',
              primaryColor,
              15,
              FontWeight.w400,
            ),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/rewardicon.png'),
            ),
            title: headerText('History', primaryColor, 15, FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/promoicon.png'),
            ),
            title: headerText('Promo Code', primaryColor, 15, FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/settingicon.png'),
            ),
            title: headerText('Settings', primaryColor, 15, FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/inviteicon.png'),
            ),
            title: headerText(
              'Invite Friends',
              primaryColor,
              15,
              FontWeight.w400,
            ),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/helpicon.png'),
            ),
            title: headerText('Help Center', primaryColor, 15, FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/abouticon.png'),
            ),
            title: headerText('About us', primaryColor, 15, FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: Image(
              width: 20,
              height: 29,
              image: AssetImage('assets/logout.png'),
            ),
            title: headerText(
              'Cerrar sesión',
              primaryColor,
              15,
              FontWeight.w400,
            ),
            trailing: Icon(Icons.chevron_right, color: gris),
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }

  Future _signOut(BuildContext context) async {
    await showAlertDialog(
      context,
      Image(width: 130, height: 130, image: AssetImage('assets/logout.png')),
      'Cierre de sesión en curso',
      '¿Desea salir de la sesión actual?',
      createButton(
        margin: EdgeInsets.only(top: 40),
        marginText: EdgeInsets.only(left: 10),
        color: orange,
        fontSize: 15,
        labelButton: 'Cerrar Sesión',
        func: () {
          _viewModel.signOut().then((result) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const WelcomePage()),
              (Route<dynamic> route) => false,
            );
          });
        },
      ),
    );
  }
}

import 'package:delivery_app/src/Features/presentation/tabs/TabsPage/View/tabs_page.dart';
import 'package:flutter/material.dart';

//pages
import 'package:delivery_app/src/Features/presentation/welcome_page/View/welcome_page.dart';
import 'package:delivery_app/src/Features/presentation/login_page/View/login_page.dart';
import 'package:delivery_app/src/Features/presentation/forgot_password_page/View/forgot_password.dart';
import 'package:delivery_app/src/Features/presentation/sign_up_page/View/sign_up_page.dart';

import 'package:delivery_app/src/Features/presentation/search_page/View/search_page.dart';
import 'package:delivery_app/src/Features/presentation/filter_page/View/filter_page.dart';
import 'package:delivery_app/src/Features/presentation/collections_page/View/collections_page.dart';
import 'package:delivery_app/src/Features/presentation/collection_detail_page/View/collection_detail_page.dart';
import 'package:delivery_app/src/Features/presentation/place_detail_page/View/place_detail_page.dart';
import 'package:delivery_app/src/Features/presentation/profile_detail_page/View/profile_detail_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => ForgotPassword(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'tabs': (BuildContext context) => TabsPage(),
  'search': (BuildContext context) => Searchpage(),
  'filter': (BuildContext context) => FilterPage(),
  'collections': (BuildContext context) => CollectionsPage(),
  'collections-detail': (BuildContext context) => CollectionDetailPage(),
  'place-detail': (BuildContext context) => PlaceDetailPage(),
  'profile-detail': (BuildContext context) => ProfileDetailPage(),

};

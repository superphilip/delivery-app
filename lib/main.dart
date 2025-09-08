import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/Provider.dart';

import 'package:flutter/material.dart';

//routes
import 'package:delivery_app/src/Routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
        ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
      ],
      child: MyAppUSerState(),
    );
  }
}

class MyAppUSerState extends StatelessWidget with BaseView {
  MyAppUSerState({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: coordinator.start(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) return MyApp(initialRoute: snapshot.data);
        return MaterialApp(
          home: Scaffold(
            body: Container(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;
  const MyApp({super.key, required String initialRoute})
    : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
        useMaterial3: true,
      ),
    );
  }
}

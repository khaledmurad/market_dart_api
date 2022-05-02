import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Auth/login_screen.dart';
import 'package:spree/screens/Home/main_widget.dart';
import 'package:spree/providers/order_provider.dart';
import 'package:spree/screens/Splash/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spree',
        theme: new ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Colors.transparent,
        ),
        home: SplashScreen());
  }

  nextSreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("token") != null) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}

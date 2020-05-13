import 'package:flutter/material.dart';
import 'hompePage.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomize',
      theme: ThemeData(      
        fontFamily: "Circular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
          name: 'assets/splash.flr',
          next: (_) => HomePage(),
          until: () => Future.delayed(Duration(seconds: 5)),
          startAnimation: 'intro',
      ),
    );
  }
}

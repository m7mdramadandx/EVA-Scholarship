import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(EvaPharma());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
}

class EvaPharma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          accentColor: primaryColor,
          textSelectionColor: red,
          indicatorColor: red,
          iconTheme: IconThemeData(color: grey),
          accentIconTheme: IconThemeData(color: grey),
          primaryIconTheme: IconThemeData(color: grey),
          cursorColor: primaryColor,
          textSelectionHandleColor: primaryColor),
      home: Home(),
    );
  }
}

import 'package:eva_pharma/screens/home.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: "Eva Scholarship",
      theme: ThemeData(
          primaryColor: Color(0xff004a7c),
          accentColor: Color(0xffcdcdcd),
          primaryColorLight: Color(0xff005691),
          scaffoldBackgroundColor: silver,
          // iconTheme: IconThemeData(color: Colors.grey),
          // accentIconTheme: IconThemeData(color: Colors.grey),
          // primaryIconTheme: IconThemeData(color: Colors.grey),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 16,
              shadowColor: grey,
              iconTheme: IconThemeData(color: Colors.grey))),
      home: Home(),
    );
  }
}

import 'package:eva_pharma/ui/screens/HomeScreen.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
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
          scaffoldBackgroundColor: Color(0xffeeeeee),
          // iconTheme: IconThemeData(color: Colors.kGreyColor),
          // accentIconTheme: IconThemeData(color: Colors.kGreyColor),
          // primaryIconTheme: IconThemeData(color: Colors.kGreyColor),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 16,
              shadowColor: kGreyColor,
              textTheme: TextTheme(
                  title: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 21,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500)),
              iconTheme: IconThemeData(color: kGreyColor))),
      home: HomeScreen(),
    );
  }
}

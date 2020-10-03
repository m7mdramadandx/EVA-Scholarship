import 'dart:io';
import 'dart:ui';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:eva_pharma/blocs/OppBloc.dart';
import 'package:eva_pharma/blocs/UniversityBloc.dart';
import 'package:eva_pharma/ui/screens/DashboardScreen.dart';
import 'package:eva_pharma/ui/screens/ExploreScreen.dart';
import 'package:eva_pharma/ui/screens/FavoriteScreen.dart';
import 'package:eva_pharma/ui/screens/NotificationsScreen.dart';
import 'package:eva_pharma/ui/screens/ProfileScreen.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TabItem> tabItems = List.of([
    new TabItem(CupertinoIcons.home, "Dashboard", kPrimaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.search, "Explore", kPrimaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.heart, "Favorite", kPrimaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.bell, "Notifications", kPrimaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.profile_circled, "Profile", kPrimaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
  ]);

  List<Widget> tabScreen = [
    DashboardScreen(),
    ExploreScreen(),
    FavoriteScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];
  int selectedPos = 0;
  double bottomNavBarHeight = 50;
  CircularBottomNavigationController _navigationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    checkInternet();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "Sorry!, no internet connection",
          webShowClose: true,
          timeInSecForIosWeb: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkInternet();
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          tabScreen[selectedPos],
          Align(alignment: Alignment.bottomCenter, child: bottomNav()),
        ],
      ), // bottomSheet: bottomNav(),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barBackgroundColor: Colors.white,
      iconsSize: 28,
      circleSize: 54,
      barHeight: bottomNavBarHeight,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
    oppBloc.dispose();
    universityBloc.dispose();
  }
}

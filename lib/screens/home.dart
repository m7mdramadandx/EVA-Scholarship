import 'dart:ui';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:eva_pharma/screens/Dashboard.dart';
import 'package:eva_pharma/screens/Scholarship.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../widgets/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TabItem> tabItems = List.of([
    new TabItem(CupertinoIcons.home, "Dashboard", primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.search, "Explore", primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.heart, "Favorite", primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.bell, "Notifications", primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(CupertinoIcons.profile_circled, "Profile", primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
  ]);

  int selectedPos = 0;
  int selectedMenuItemId;
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();
  String title;

  double bottomNavBarHeight = 50;

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
    title = "Hey";
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    checkInternet();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MainWidget(),
            Align(alignment: Alignment.bottomCenter, child: bottomNav()),
          ],
        ), // bottomSheet: bottomNav(),
      ),
    );
  }

  Widget MainWidget() {
    if (selectedPos == 0) {
      return Dashboard();
    } else if (selectedPos == 1) {
      return Explore();
    } else if (selectedPos == 2) {
      return Stack(
        children: <Widget>[
          Center(child: Text("Favorite")),
        ],
      );
    } else if (selectedPos == 3) {
      return Stack(
        children: <Widget>[
          Center(child: Text("Notification")),
        ],
      );
    } else if (selectedPos == 4) {
      return Stack(
        children: <Widget>[
          Center(child: Text("Profile")),
        ],
      );
    }
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
          print(_navigationController.value);
        });
      },
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan;
    switch (selectedPos) {
      case 0:
        slogan = "Familly, Happiness, Food";
        break;
      case 1:
        slogan = "Find, Check, Use";
        break;
      case 2:
        slogan = "Receive, Review, Rip";
        break;
      case 3:
        slogan = "Noise, Panic, Ignore";
        break;
    }

    return GestureDetector(
      child: Container(
        color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
      // onHorizontalDragEnd: (DragEndDetails endDetails) {
      //   if (_navigationController.value == tabItems.length - 1) {
      //     _navigationController.value = 0;
      //   } else {
      //     _navigationController.value++;
      //   }
      // },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}

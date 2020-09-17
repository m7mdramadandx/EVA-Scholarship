import 'dart:io';
import 'dart:ui';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:eva_pharma/SwiperWidget.dart';
import 'package:eva_pharma/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", red,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(Icons.search, "Search", green,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(Icons.question_answer, "Tips", yellow,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
    new TabItem(Icons.notifications, "Notifications", orange,
        labelStyle: TextStyle(fontWeight: FontWeight.w500)),
  ]);

  List<String> imgUrl = [
    "https://static01.nyt.com/images/2020/03/14/upshot/14up-colleges-remote/14up-colleges-remote-facebookJumbo.jpg",
    "https://cdn.uncf.org/wp-content/uploads/heroes/2018LaneCollege1440-1024x544.jpg",
    "https://cdn.uncf.org/wp-content/uploads/member_colleges/talledega/TalladegaLibrary800.jpg",
    "https://www.bestvalueschools.org/wp-content/uploads/2017/08/7633545e449854b939174fafc89bf5.jpg"
  ];

  int selectedPos = 0;
  int selectedMenuItemId;
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();
  String title;

  double bottomNavBarHeight = 50;
  bool connected = true;

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
    title = "Hey";
  }

  checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('TRUE');
        connected = true;
      }
    } on SocketException catch (_) {
      print('FALSE');
      connected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    checkInternet();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: silver,
          actionsIconTheme: IconThemeData(color: grey),
          title: Text(title,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: primaryColor)),
        ),
        body: Stack(
          children: [
            MainWidget(),
            Align(alignment: Alignment.bottomCenter, child: bottomNav()),
          ],
        ), // bottomSheet: bottomNav(),
      ),
    );
  }

  Widget _checkInternet() {
    return connected
        ? Container()
        : Positioned(
            height: 24.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: red,
              child: Center(child: Text('OFFLINE')),
            ),
          );
  }

  Widget x() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "data",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        SwiperWidget(imgUrl),
        SizedBox(height: 16),
        Text(
          "data",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        SwiperWidget(imgUrl),
        Text(
          "data",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        SwiperWidget(imgUrl),
        SizedBox(height: 16),
        Text(
          "data",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        SwiperWidget(imgUrl),
      ],
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

  MainWidget() {
    if (selectedPos == 0) {
      setState(() {
        title = "Home";
      });
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: x(),
      );
    } else if (selectedPos == 1) {
      setState(() {
        title = "Search";
      });
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            Text("Search"),
          ],
        ),
      );
    } else if (selectedPos == 2) {
      setState(() {
        title = "Q and A";
      });
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            _checkInternet(),
            Center(child: Text("Q and A")),
          ],
        ),
      );
    } else if (selectedPos == 3) {
      setState(() {
        title = "Notification";
      });
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            _checkInternet(),
            Center(child: Text("Notification")),
          ],
        ),
      );
    }
  }

  Widget bottomNav() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        barBackgroundColor: silver,
        barHeight: bottomNavBarHeight,
        animationDuration: Duration(milliseconds: 300),
        selectedCallback: (int selectedPos) {
          setState(() {
            this.selectedPos = selectedPos;
            print(_navigationController.value);
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}

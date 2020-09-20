import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Welcome To Eva Scholarship',
                style: TextStyle(
                  fontSize: 30.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // CustomListView(title: "Top Rated"),
            SizedBox(height: 20.0),
            // CustomListView(title: "Recently Added"),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          // backgroundColor: Theme.of(context).primaryColor,
          // type: BottomNavigationBarType.shifting,
          elevation: 16,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, size: 30.0),
              title: Text("Dashboard"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30.0),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30.0),
              title: Text("Favorite"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 30.0),
              title: Text("Notification"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 30.0),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

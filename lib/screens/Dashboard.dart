import 'package:eva_pharma/widgets/CustomListView.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 120.0),
          child: Text('Welcome To Eva Scholarship',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: lightColor)),
        ),
        SizedBox(height: 40.0),
        CustomListView(title: "Top Rated"),
        SizedBox(height: 20.0),
        CustomListView(title: "Recently Added"),
      ]),
    );
  }
}

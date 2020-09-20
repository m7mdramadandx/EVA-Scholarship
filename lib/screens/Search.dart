import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.filter,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          )
        ],
        title: Text('Default app bar title'),
      ),
    );
  }
}

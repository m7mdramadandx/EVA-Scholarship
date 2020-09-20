import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  Opportunity opportunity;

  DetailsScreen(this.opportunity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(opportunity),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              onPressed: () {},
              child: Text(
                "More Details",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text(
                "APPLY NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

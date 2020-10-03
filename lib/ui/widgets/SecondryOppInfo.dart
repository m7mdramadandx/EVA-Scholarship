import 'package:eva_pharma/models/Benefits.dart';
import 'package:eva_pharma/models/Eligibility.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryOppInfo extends StatelessWidget {
  final Opportunity opportunity;

  SecondaryOppInfo({
    Key key,
    this.opportunity,
  }) : super(key: key);

  final divider = Container(height: 1, color: Colors.black12);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    eligibility(opportunity.eligibility),
                    SizedBox(height: 16),
                    requiredTests(),
                    SizedBox(height: 16),
                    benefits(opportunity.benefits),
                  ]))
        ]);
  }

  Widget benefits(Benefits benefits) {
    return benefits == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header('Benefits'),
              SizedBox(height: 4),
              Column(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Medical',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child:
                          Text(benefits.medical, style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Salary',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child:
                          Text(benefits.salary, style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Accommodation',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child: Text(benefits.accommodation,
                          style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Prize',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child:
                          Text(benefits.prize, style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Other',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child:
                          Text(benefits.other, style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: divider,
                  ),
                ],
              )
            ],
          );
  }

  Widget requiredTests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header('Required Tests'),
        SizedBox(height: 4),
        Column(
          children: [
            Row(children: [
              Expanded(
                flex: 40,
                child: Text('Ielts',
                    style: TextStyle(
                        color: kPrimaryColor,
                        height: 1.5,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(width: 4),
              Expanded(
                flex: 80,
                child: Text(opportunity.ieltsLevel.toString(),
                    style: TextStyle(height: 1.5)),
              )
            ]),
            Row(children: [
              Expanded(
                flex: 40,
                child: Text('Toefl',
                    style: TextStyle(
                        color: kPrimaryColor,
                        height: 1.5,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(width: 4),
              Expanded(
                flex: 80,
                child: Text(opportunity.toeflLevel.toString(),
                    style: TextStyle(height: 1.5)),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: divider,
            ),
          ],
        )
      ],
    );
  }

  Widget eligibility(Eligibility eligibility) {
    return eligibility == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header('Eligibility'),
              SizedBox(height: 4),
              Column(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Gender',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child: Text(eligibility.gender,
                          style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Age',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child: Text(eligibility.age.toString(),
                          style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 40,
                      child: Text('Other',
                          style: TextStyle(
                              color: kPrimaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 80,
                      child: Text(eligibility.other,
                          style: TextStyle(height: 1.5)),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: divider,
                  ),
                ],
              )
            ],
          );
  }

  Widget header(String header) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(header,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          Container(
              margin: EdgeInsets.only(top: 4), //top padding 5
              height: 2,
              width: 40,
              color: kPrimaryColor)
        ],
      ),
    );
  }
}

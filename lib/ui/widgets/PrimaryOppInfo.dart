import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

class PrimaryOppInfo extends StatelessWidget {
  final Opportunity opportunity;

  PrimaryOppInfo({
    Key key,
    this.opportunity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(height: 1, color: Colors.black12);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Text('${opportunity.title}',
                  style: Theme.of(context).textTheme.headline5)),
          divider,
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    header('Description'),
                    info('${opportunity.description}'),
                    header('Specialties'),
                    info('${opportunity.specialization}'),
                    header('Funding'),
                    info('${opportunity.fundType}'),
                    header('Duration'),
                    info('${opportunity.duration}'),
                    header('Deadline'),
                    info('${opportunity.applicationDeadline}'),
                  ]))
        ]);
  }

  Widget info(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 20),
      child: Text(text, style: TextStyle(height: 1.5)),
    );
  }

  Widget header(String header) {
    return Column(
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
    );
  }
}

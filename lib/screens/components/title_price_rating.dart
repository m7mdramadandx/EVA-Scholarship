import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/material.dart';

class oppertunityInfo extends StatelessWidget {
  final Opportunity opportunity;

  oppertunityInfo({
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
                  style: Theme.of(context).textTheme.headline)),
          divider,
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    header('Description', context),
                    info('${opportunity.description}'),
                    header('Funding', context),
                    info('${opportunity.fundingType}'),
                    header('Deadline', context),
                    info('${opportunity.deadline}'),
                    header('Degree Type', context),
                    info('${opportunity.type}'),
                    header('Duration', context),
                    info('${opportunity.duration}'),
                    header('Required Degree', context),
                    info('${opportunity.requiredDegree}'),
                    header('Specialties', context),
                    info('${opportunity.specialties}'),
                    divider
                  ]))
        ]);
  }

  Widget info(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 20),
      child: Text(
        text,
        style: TextStyle(height: 1.5),
      ),
    );
  }

  Widget header(String header, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            style: Theme.of(context).textTheme.title,
          ),
          Container(
            margin: EdgeInsets.only(top: 4), //top padding 5
            height: 2,
            width: 40,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {int price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 66,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "\$$price",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

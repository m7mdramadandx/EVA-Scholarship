import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/PrimaryOppInfo.dart';
import '../widgets/SecondryOppInfo.dart';

class OppInfoScreen extends StatefulWidget {
  OppInfoScreen(this.opportunity) : super();

  Opportunity opportunity;

  @override
  _OppInfoScreenState createState() => _OppInfoScreenState();
}

class _OppInfoScreenState extends State<OppInfoScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: widget.opportunity.imageUrl,
              child: CachedNetworkImage(
                  width: size.width,
                  height: size.height * 0.35,
                  imageUrl: widget.opportunity.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(8.0, 8.0),
                                blurRadius: 8.0)
                          ]))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, size.height * 0.3, 8, 0),
              child: opportunityInfo(),
            ),
            Positioned(
              right: 8,
              top: size.height * 0.3,
              child: FloatingActionButton(
                heroTag: "favorite",
                elevation: 8,
                mini: true,
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey),
                backgroundColor: kAccentColor,
              ),
            ),
            Positioned(
              left: 8,
              top: 16,
              child: FloatingActionButton(
                heroTag: "back",
                elevation: 8,
                mini: true,
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              onPressed: () {},
              child: Text(
                "Official Link",
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
                  topLeft: Radius.circular(20),
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

  Widget opportunityInfo() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.business),
                SizedBox(width: 10),
                Text('${widget.opportunity.universityName}')
              ]),
              PrimaryOppInfo(opportunity: widget.opportunity),
            ],
          ),
        ),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: SecondaryOppInfo(opportunity: widget.opportunity),
        ),
      ],
    );
  }
}

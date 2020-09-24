import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/ui/screens/OppInfoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class OppCard extends StatefulWidget {
  OppCard(this._opportunity) : super();

  final Opportunity _opportunity;

  @override
  _OppCardState createState() => _OppCardState();
}

class _OppCardState extends State<OppCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OppInfoScreen(widget._opportunity)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.2, 6.0, 0.0, 6.0),
              height: 140.0,
              width: size.width,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.32, 10, 32, 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget._opportunity.universityName,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      widget._opportunity.type,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      widget._opportunity.fundingType,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      widget._opportunity.duration,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: 80,
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(widget._opportunity.deadline),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              top: 16.0,
              bottom: 16.0,
              child: Hero(
                tag: widget._opportunity.imageUrl,
                child: CachedNetworkImage(
                  imageUrl: widget._opportunity.imageUrl,
                  width: size.width * 0.5,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 8.0),
                              blurRadius: 8.0)
                        ],
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(15))),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 10,
                right: 0,
                child: IconButton(
                    icon: Icon(CupertinoIcons.delete,
                        color: Colors.white, size: 19),
                    onPressed: null))
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/screens/OppInfoScreen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class OppCard extends StatelessWidget {
  OppCard(this._opportunity) : super();

  final Opportunity _opportunity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OppInfoScreen(_opportunity)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 6.0, 0.0, 0.0),
              height: size.height * 0.22,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(100.0, 5.0, 10.0, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            _opportunity.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            _opportunity.universityName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      _opportunity.description,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    SizedBox(height: 6.0),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      width: 100,
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(_opportunity.applicationDeadline),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              top: 16.0,
              bottom: 16.0,
              child: Hero(
                tag: _opportunity.id,
                child: CachedNetworkImage(
                  imageUrl: _opportunity.university.imgUrl ??
                      'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png',
                  width: 110,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 8.0)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

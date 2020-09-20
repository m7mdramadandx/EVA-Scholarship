import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/screens/components/title_price_rating.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Opportunity _opportunity;

  Body(this._opportunity);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
              width: size.width,
              height: size.height * 0.3,
              imageUrl: _opportunity.imageUrl,
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
          itemInfo(),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }

  Widget itemInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.business),
              SizedBox(width: 10),
              Text('${_opportunity.universityName}'),
            ],
          ),
          oppertunityInfo(opportunity: _opportunity),
        ],
      ),
    );
  }
}

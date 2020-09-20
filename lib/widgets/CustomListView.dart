import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  String title;

  CustomListView({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Color(0xff005691),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: opportunityList.length,
            itemBuilder: (BuildContext context, int index) {
              Opportunity _opportunity = opportunityList[index];
              return Container(
                margin: EdgeInsets.all(12.0),
                width: 250.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: 120.0,
                        width: 240.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _opportunity.title,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                  letterSpacing: 1.2,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(height: 8),
                              Text(
                                _opportunity.field,
                              ),
                              SizedBox(height: 4),
                              Text(
                                _opportunity.description,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ///////////------ Img
                    Container(
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: _opportunity.imageUrl,
                            width: 260,
                            height: 160,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(8.0, 8.0),
                                        blurRadius: 8.0)
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Text(
                              _opportunity.type,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Text(
                                      _opportunity.rate.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(Icons.star, color: yellow, size: 18)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

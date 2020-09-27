import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/ui/screens/OppInfoScreen.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DashboardCard extends StatelessWidget {
  Opportunity opportunity;

  DashboardCard(this.opportunity) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OppInfoScreen(opportunity)),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              child: Container(
                height: size.height * 0.2,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        opportunity.universityName,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        opportunity.title,
                        style: TextStyle(
                          color: kGreyColor,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                        child: Text(opportunity.deadline),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ///////////------ Img
            Container(
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: opportunity.imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: opportunity.imageUrl,
                      width: size.width * 0.7,
                      height: size.height * 0.2,
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
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Text(
                      opportunity.type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    bottom: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600.withAlpha(150),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Text(
                              opportunity.rate.toString(),
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
      ),
    );
  }
}

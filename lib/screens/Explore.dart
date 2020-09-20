import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/screens/details-screen.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.filter),
            onPressed: () {},
          )
        ],
        title: TextField(
          onTap: () => showSearch(context: context, delegate: DataSearch()),
          readOnly: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 19),
              icon: Icon(CupertinoIcons.search)),
          textInputAction: TextInputAction.search,
        ),
      ),
      body: Stack(
        children: [
          abd(context),
        ],
      ),
    );
  }

  Widget abd(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: ListView.builder(
        itemCount: opportunityList.length,
        itemBuilder: (BuildContext context, int index) {
          Opportunity _opportunity = opportunityList[index];

          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(_opportunity)),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40.0, 6.0, 0.0, 6.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100.0, 10.0, 16.0, 10.0),
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
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                _opportunity.universityName,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: accentColor),
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
                            color: Colors.white70,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        SizedBox(height: 6.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          width: 80,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(_opportunity.deadline),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                  child: CachedNetworkImage(
                    imageUrl: _opportunity.imageUrl,
                    width: 110,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 8.0)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

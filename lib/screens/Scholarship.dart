import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_pharma/models/scholarship.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  List<Scholarship> result;

  Future<List<Scholarship>> search(String searchKey) async {
    result = new List();
    await Future.delayed(Duration(seconds: 1));
    scholarship.map((e) {
      if (e.type.contains(searchKey)) {
        print('Found');
        result.add(e);
      }
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: SearchBar<Scholarship>(
          onSearch: search,
          icon: Icon(CupertinoIcons.search),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          // searchBarController: _searchBarController,
          iconActiveColor: primaryColor,
          hintText: "Explore",
          placeHolder: abd(),
          onError: (error) {
            return Text("Error occurred : $error");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          header: Row(
            children: [
              RaisedButton(
                child: Text("sort"),
                onPressed: () {
                  // _searchBarController.sortList((Post a, Post b) {
                  //   return a.body.compareTo(b.body);
                  // }
                  // );
                },
              ),
              RaisedButton(
                child: Text("Desort"),
                onPressed: () {
                  // _searchBarController.removeSort();
                },
              ),
              RaisedButton(
                child: Text("Replay"),
                onPressed: () {
                  // _searchBarController.replayLastSearch();
                },
              ),
            ],
          ),
          emptyWidget: Text("Not found"),
          searchBarStyle: SearchBarStyle(
              padding: EdgeInsets.symmetric(horizontal: 10),
              borderRadius: BorderRadius.circular(10)),
          onItemFound: (Scholarship scholarship, int index) {
            return Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text(scholarship.type),
                isThreeLine: true,
                subtitle: Text(scholarship.description),
                onTap: () {
                  print('OnTap');
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget abd() {
    ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 6.0, 0.0, 6.0),
              height: 150.0,
              decoration: BoxDecoration(
                color: primaryColor,
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
                        Container(
                          width: 140.0,
                          child: Text(
                            "University",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          width: 50,
                          child: Text(
                            'fully funded',
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
                      "A fully funded Camp for English Conversation Facilitators in Alexandria and Cairo",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
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
                      child: Text(
                        "00/00/2020",
                        // style: TextStyle(color: primaryColor),
                      ),
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
                imageUrl:
                    "https://www.bestvalueschools.org/wp-content/uploads/2017/08/7633545e449854b939174fafc89bf5.jpg",
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
        );
      },
    );
  }
}

/*
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 6.0, 0.0, 6.0),
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: primaryColor,
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
                                Container(
                                  width: 140.0,
                                  child: Text(
                                    "University",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: Text(
                                    'fully funded',
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
                              "A fully funded Camp for English Conversation Facilitators in Alexandria and Cairo",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
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
                              child: Text(
                                "00/00/2020",
                                // style: TextStyle(color: primaryColor),
                              ),
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
                        imageUrl:
                            "https://www.bestvalueschools.org/wp-content/uploads/2017/08/7633545e449854b939174fafc89bf5.jpg",
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
                );
              },
            ),
          ),


 */

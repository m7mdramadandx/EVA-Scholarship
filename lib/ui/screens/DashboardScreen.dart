import 'package:eva_pharma/blocs/OppBloc.dart';
import 'package:eva_pharma/blocs/UniversityBloc.dart';
import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/CustomListView.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen() : super();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  OppBloc _oppBloc;

  @override
  void initState() {
    super.initState();
    _oppBloc = OppBloc();
    UniversityBloc();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 120, 30),
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50))),
                      child: Text('Welcome To Eva Scholarship',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white))),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 18,
                                  color: Colors.black26),
                            ]),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: TextField(
                            onTap: () {
                              showSearch(
                                  context: context, delegate: DataSearch());
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: TextStyle(fontSize: 19)),
                            textInputAction: TextInputAction.search,
                          )),
                          Icon(CupertinoIcons.search)
                        ])),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            fetchData()
          ]),
        ),
      ),
    );
  }

  Widget fetchData() {
    return StreamBuilder<List<Opportunity>>(
        stream: _oppBloc.opportunityList,
        builder: (context, AsyncSnapshot<List<Opportunity>> snapshot) {
          if (snapshot.hasData) {
            return _buildDashboard(snapshot.data, context);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: CircularProgressIndicator(backgroundColor: kPrimaryColor),
          );
        });
  }

  Widget _buildDashboard(List<Opportunity> data, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Top Rated",
                      style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 1.5,
                      )),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 60,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'See All',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.4,
              child: RefreshIndicator(
                onRefresh: () => _oppBloc.fetchOpportunities(),
                color: kPrimaryColor,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => DashboardCard(data[index]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Most Popular",
                      style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 1.5,
                      )),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 60,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'See All',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   height: size.height * 0.4,
            //   child: ListView.builder(
            //     itemCount: data.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => DashboardCard(data[index]),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 40.0),
      ],
    );
  }
}

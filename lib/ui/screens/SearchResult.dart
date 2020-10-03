import 'package:eva_pharma/blocs/SearchBloc.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/OppCard.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  // List<Opportunity> _opportunity ;
  final String query;

  SearchResultScreen(this.query);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<Opportunity>>(
        stream: _searchBloc.opportunityList,
        builder: (context, AsyncSnapshot<List<Opportunity>> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.hasData) {
            print(snapshot.data.length);
            return _buildExplore(snapshot.data, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(backgroundColor: kPrimaryColor));
        });
  }

  Widget _buildExplore(List<Opportunity> data, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      width: size.width,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => OppCard(data[index])),
    );
  }
}

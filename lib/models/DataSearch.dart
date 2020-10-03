import 'package:eva_pharma/blocks/SearchBloc.dart';
import 'package:eva_pharma/models/University.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final cities = [
    "AUC",
    'GUC',
    'BUE',
    'MSA',
    'MUST',
    'Nile University',
  ];

  final recentCities = [
    'BUE',
    'MSA',
    'MUST',
    'Nile University',
  ];
  University _university = University();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(CupertinoIcons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: universityBloc.university,
      builder: (context, AsyncSnapshot<List<University>> snapshot) {
        if (snapshot.hasData) {
          return _buildSuggestions(snapshot.data, context);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  method() {
    String getFirstLetter = query.substring(0, 1);
    return query.replaceRange(0, 1, getFirstLetter.toUpperCase());
  }

  Widget _buildSuggestions(List<University> data, BuildContext context) {
    if (query.isNotEmpty) {
      data = data
          .where((element) => element.name.toLowerCase().startsWith(query))
          .toList();
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            _university = data[index];
            showResults(context);
          },
          leading: Icon(Icons.business),
          title: RichText(
            text: TextSpan(
              text: data[index].name.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: data[index].name.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          subtitle: Text(data[index].city),
        );
      },
      itemCount: data.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.green,
          child: Center(
            child: Text(_university.name),
          ),
        ),
      ),
    );
  }
}

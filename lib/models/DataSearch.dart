import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final cities = [
    "alex",
    'cairo',
    'giza',
    'mansoura',
    'tanta',
    'sharm',
    'aswan'
  ];
  final recentCities = [
    "alex",
    'cairo',
    'giza',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(CupertinoIcons.clear),
          onPressed: () {
            query = '';
          }),
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        close(context, null);
      },
    );

    throw UnimplementedError();
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
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.title),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

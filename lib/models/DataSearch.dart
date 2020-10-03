import 'package:eva_pharma/blocs/UniversityBloc.dart';
import 'package:eva_pharma/models/University.dart';
import 'package:eva_pharma/ui/screens/SearchResult.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String _query = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(CupertinoIcons.clear),
          onPressed: () {
            query = '';
            super.showSuggestions(context);
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
    List<University> data = UniversityBloc.universityList;
    if (query.isNotEmpty) {
      data = data
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
    return UniversityBloc.universityList.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _query = data[index].id.toString();
                  query = data[index].name;
                  showResults(context);
                },
                leading: Icon(Icons.business),
                title: RichText(
                  text: TextSpan(
                    text: data[index].name.substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: data[index].name.substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                subtitle: Text(data[index].city),
                trailing: Text(data[index].rate.toString()),
              );
            },
            itemCount: data.length,
          )
        : Center(
            child: CircularProgressIndicator(backgroundColor: kPrimaryColor));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultScreen(_query);
  }
}

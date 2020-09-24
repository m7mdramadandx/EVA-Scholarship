import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OppTypes extends StatefulWidget {
  @override
  _OppTypesState createState() => _OppTypesState();
}

class _OppTypesState extends State<OppTypes> {
  List<String> categories = [
    "IB",
    "Bachelor",
    "Master",
    "PHD",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        padding: EdgeInsets.symmetric(horizontal: 8),
        label: selectedIndex == index
            ? Text(categories[index], style: TextStyle(color: kPrimaryColor))
            : Text(categories[index], style: TextStyle(color: Colors.white)),
        backgroundColor: selectedIndex == index ? Colors.white : kPrimaryColor,
        elevation: 4,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedIndex = index;
              // _filters.add(company.name);
            } else {
              // _filters.removeWhere((String name) {
              //   return name == company.name;
              // });
            }
          });
        },
      ),
    );
  }
}

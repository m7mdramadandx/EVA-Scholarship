import 'package:flutter/material.dart';

import 'colors.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "New Collection",
    "Shirts",
    "Footwear",
    "Tie",
    "Dresses"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: selectedIndex == index ? accentColor : kPrimaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4), //top padding 5
              height: 2,
              width: 30,
              color:
                  selectedIndex == index ? kPrimaryColor : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:eva_pharma/models/Menu.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  List<Specialties> _dropdownItems = [
    Specialties(1, "Computer Science and Engineer"),
    Specialties(2, "Law"),
    Specialties(3, "Business"),
    Specialties(4, "Accountant")
  ];

  List<DropdownMenuItem<Specialties>> _dropdownMenuItems;

  Specialties _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<Specialties>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Specialties>> items = List();
    for (Specialties specialties in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(specialties.speciality, overflow: TextOverflow.ellipsis),
          value: specialties,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Field",
            style:
                TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600)),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: kAccentColor),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                hint: Text("Select you Field"),
                style: TextStyle(color: kGreyColor),
                isDense: true,
                elevation: 8,
                value: _selectedItem,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                    print(_selectedItem.speciality);
                  });
                }),
          ),
        ),
      ],
    );
  }
}

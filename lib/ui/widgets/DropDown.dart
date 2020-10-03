import 'package:eva_pharma/models/Menu.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DropDownMenu extends StatefulWidget {
  final List<SpecialtiesMenu> dropDownList;
  final Function(String) onSelectionChanged; // +added
  DropDownMenu(this.dropDownList, {this.onSelectionChanged});

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  List<DropdownMenuItem<SpecialtiesMenu>> _dropdownMenuItems;

  SpecialtiesMenu _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(widget.dropDownList);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<SpecialtiesMenu>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<SpecialtiesMenu>> items = List();
    for (SpecialtiesMenu specialties in listItems) {
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
                    widget.onSelectionChanged(_selectedItem.speciality);
                  });
                }),
          ),
        ),
      ],
    );
  }
}

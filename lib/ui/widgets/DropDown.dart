import 'package:flutter/material.dart';

import 'colors.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> dropDownList;
  final Function(String) onSelectionChanged;

  DropDownMenu({this.dropDownList, this.onSelectionChanged});

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String _selectedItem;

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
                hint: Text("Select you field"),
                style: TextStyle(color: kGreyColor),
                isDense: true,
                elevation: 8,
                value: _selectedItem,
                items: widget.dropDownList
                    .map((String value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                    widget.onSelectionChanged(_selectedItem);
                  });
                }),
          ),
        ),
      ],
    );
  }
}

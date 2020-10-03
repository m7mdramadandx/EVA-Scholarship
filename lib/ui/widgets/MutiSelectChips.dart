import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> choicesList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip({this.choicesList, this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.choicesList.map((item) {
      choices.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ChoiceChip(
          elevation: 4,
          padding: EdgeInsets.symmetric(horizontal: 8),
          selectedColor: kPrimaryColor,
          label: Text(item,
              style: selectedChoices.contains(item)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: kGreyColor)),
          backgroundColor: kAccentColor,
          selectedShadowColor: kPrimaryColor,
          pressElevation: 8,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    }).toList();
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

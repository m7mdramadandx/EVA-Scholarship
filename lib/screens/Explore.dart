import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/widgets/DropDown.dart';
import 'package:eva_pharma/widgets/MutiSelectChips.dart';
import 'package:eva_pharma/widgets/OppLightCard.dart';
import 'package:eva_pharma/widgets/OppTypes.dart';
import 'package:eva_pharma/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _defaultChoiceIndex;

  List<String> selectedChoices = List();
  Opportunity opportunity;

  List<String> reportList = new List();

  List<String> reportList2 = [
    "Funded",
    "fully",
    "not",
    "partially",
    "awarded",
  ];

  void initState() {
    super.initState();
    _defaultChoiceIndex = 0;

    opportunityList.forEach((element) {
      reportList.add(element.type);
    });
  }

  final divider = Container(height: 1, color: Colors.black12);

  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
      insetPadding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MultiSelectChip(
                reportList,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedChoices = selectedList;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: divider,
              ),
              DropDown(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: divider,
              ),
              MultiSelectChip(
                reportList2,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedChoices = selectedList;
                    print(selectedChoices.toList());
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: divider,
              ),
              RawMaterialButton(
                onPressed: null,
                fillColor: kPrimaryColor,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Search"),
              )
            ],
          ),
        ),
      ),
    );

    _showReportDialog() {
      showDialog(
          context: context, builder: (BuildContext context) => errorDialog);
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.search),
              padding: EdgeInsets.only(right: 10),
              onPressed: () =>
                  showSearch(context: context, delegate: DataSearch())),
          IconButton(
              icon: Icon(Icons.filter_list),
              padding: EdgeInsets.only(right: 10),
              onPressed: () => _showReportDialog()),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            OppTypes(),
            SizedBox(height: 10),
            ...List.generate(opportunityList.length,
                (index) => OppLightCard(opportunityList[index])),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

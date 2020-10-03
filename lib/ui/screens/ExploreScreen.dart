import 'package:eva_pharma/blocs/OppBloc.dart';
import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/DropDown.dart';
import 'package:eva_pharma/ui/widgets/MutiSelectChips.dart';
import 'package:eva_pharma/ui/widgets/OppCard.dart';
import 'package:eva_pharma/ui/widgets/OppTypes.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Opportunity opportunity;
  OppBloc _oppBloc;

  List<String> selectedOppType = List();
  List<String> selectedFundingType = List();
  String selectedField;
  List<String> oppType = [
    "IB",
    "Bachelor",
    "Master",
    "PHD",
  ];

  List<String> fundingType = [
    "fully funded",
    "No Funding",
    "partially",
    "awarded",
  ];

  List<String> specialtiesItems = [
    "Computer Science and Engineer",
    "Law",
    "Business",
    "Accountant",
    "Oracle"
  ];

  void initState() {
    super.initState();
    _oppBloc = OppBloc();
  }

  final divider = Container(height: 1, color: Colors.black12);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Dialog filterDialog = Dialog(
      insetPadding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.85,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiSelectChip(
                choicesList: oppType,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedOppType = selectedList;
                    print(selectedOppType.toString());
                  });
                },
              ),
              Padding(padding: EdgeInsets.all(8), child: divider),
              DropDownMenu(
                dropDownList: specialtiesItems,
                onSelectionChanged: (selectedItem) {
                  setState(() {
                    selectedField = selectedItem;
                    print(selectedField);
                  });
                },
              ),
              Padding(padding: const EdgeInsets.all(8), child: divider),
              MultiSelectChip(
                choicesList: fundingType,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedFundingType = selectedList;
                    print(selectedFundingType.toList());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );

    _showFilterDialog() {
      selectedOppType = List();
      selectedField = '';
      selectedFundingType = List();
      showDialog(
          context: context, builder: (BuildContext context) => filterDialog);
    }

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
              onPressed: () => _showFilterDialog()),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            OppTypes(),
            SizedBox(height: 10),
            fetchData(selectedOppType, selectedField, selectedFundingType),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget fetchData(
      List<String> oppType, String field, List<String> fundingType) {
    // final List<Opportunity> filteredData = snapshot.data
    //     .where((element) => element.oppType.contains(oppType.toString()))
    //     .where((element) => element.specialization.contains(field))
    //     .where((element) =>
    //     element.fundType.contains(fundingType.toString()))
    //     .toList();

    return StreamBuilder<List<Opportunity>>(
        stream: _oppBloc.opportunityList,
        builder: (context, AsyncSnapshot<List<Opportunity>> snapshot) {
          if (snapshot.hasData) {
            List<Opportunity> filteredData = List();
            // oppType.forEach((element) {
            //   snapshot.data
            //       .where((opp) => opp.oppType.contains(element))
            //       .forEach((element) {
            //     filteredData.add(element);
            //   });
            // });
            snapshot.data
                .where((element) => element.specialization == field)
                .forEach((element) {
              filteredData.add(element);
            });
            fundingType.forEach((f) {
              snapshot.data
                  .where((opp) => opp.fundType == (f))
                  .forEach((element) {
                filteredData.add(element);
              });
            });
            filteredData.length == 0
                ? Fluttertoast.showToast(msg: "Sorry!, no result found")
                : Fluttertoast.showToast(
                    msg: "${filteredData.length} result found");
            return _buildExplore(
                filteredData.isNotEmpty ? filteredData : snapshot.data,
                context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return CircularProgressIndicator(backgroundColor: kPrimaryColor);
        });
  }

  Widget _buildExplore(List<Opportunity> data, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      child: RefreshIndicator(
        onRefresh: () => _oppBloc.fetchOpportunities(),
        color: kPrimaryColor,
        child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => OppCard(data[index])),
      ),
    );
  }
}

import 'package:eva_pharma/blocks/OppBloc.dart';
import 'package:eva_pharma/models/DataSearch.dart';
import 'package:eva_pharma/models/Menu.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/DropDown.dart';
import 'package:eva_pharma/ui/widgets/MutiSelectChips.dart';
import 'package:eva_pharma/ui/widgets/OppCard.dart';
import 'package:eva_pharma/ui/widgets/OppTypes.dart';
import 'package:eva_pharma/ui/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Opportunity opportunity;
  OppBloc _oppBloc;

  List<String> selectedOppType = List();
  List<String> selectedFundingType = List();
  String selectedFieldItem = '';
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
        height: size.height * 0.6,
        width: size.width * 0.85,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MultiSelectChip(
                  oppType,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedOppType = selectedList;
                      print(selectedOppType.toString());
                    });
                  },
                ),
                Padding(padding: EdgeInsets.all(8), child: divider),
                DropDownMenu(
                  specialtiesItems,
                  onSelectionChanged: (selectedItem) {
                    setState(() {
                      selectedFieldItem = selectedItem;
                      print(selectedFieldItem);
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.all(8), child: divider),
                MultiSelectChip(
                  fundingType,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedFundingType = selectedList;
                      print(selectedFundingType.toList());
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.all(16), child: divider),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
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
      ),
    );

    _showFilterDialog() {
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
            fetchData(selectedOppType, 'null', selectedFundingType),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget fetchData(
      List<String> oppType, String field, List<String> fundingType) {
    print('Fetching');

    return StreamBuilder(
        stream: oppBloc.opportunityList,
        builder: (context, AsyncSnapshot<List<Opportunity>> snapshot) {
          if (snapshot.hasData) {
            final List<Opportunity> filteredData = snapshot.data
                // .where((element) => element.oppType == oppType)
                .where((element) => element.specialization.contains(field))
                .where((element) =>
                    element.fundType.contains(fundingType.toString()))
                .toList();
            print(filteredData.toString());
            return _buildExplore(filteredData, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return CircularProgressIndicator(backgroundColor: kPrimaryColor);
        });
  }

  Widget _buildExplore(List<Opportunity> data, BuildContext context) {
    print(data.toList());
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

  @override
  void dispose() {
    _oppBloc.dispose();
    super.dispose();
  }
}

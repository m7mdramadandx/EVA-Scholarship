import 'package:eva_pharma/blocks/OppBloc.dart';
import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/ui/widgets/CustomListView.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    oppBloc.fetchOpportunities();
    return StreamBuilder(
        stream: oppBloc.opportunityList,
        builder: (context, AsyncSnapshot<List<Opportunity>> snapshot) {
          if (snapshot.hasData) {
            return _buildWeatherScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Container _buildWeatherScreen(List<Opportunity> data) {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => DashboardCard(data[index]),
      ),
    );
  }
}

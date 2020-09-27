import 'package:eva_pharma/models/opportunity.dart';
import 'package:eva_pharma/ui/widgets/OppSolidCard.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            ...List.generate(opportunityList.length,
                (index) => OppSolidCard(opportunityList[index])),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

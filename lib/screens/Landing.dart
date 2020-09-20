import 'package:flutter/material.dart';

import '../widgets/colors.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Scaffold(backgroundColor: kPrimaryColor);
      },
    );
  }
}

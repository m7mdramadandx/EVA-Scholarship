import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar(this.title);

  final String title;
  final double barHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return PreferredSize(
      preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      child: new Container(
        padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
          child: new Text(
            title,
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [Colors.red, Colors.yellow]),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey[500],
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ],
        ),
      ),
    );
  }

}

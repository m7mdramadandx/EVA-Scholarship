import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

bool connected = true;

checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('TRUE');
      connected = true;
    }
  } on SocketException catch (_) {
    print('FALSE');
    connected = false;
  }
}

Widget _checkInternet() {
  return connected
      ? Container()
      : Positioned(
          height: 24.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: red,
            child: Center(child: Text('OFFLINE')),
          ),
        );
}

const double formContainerHeight = 430;

const kTitleTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Cairo',
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const title = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Cairo',
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);
const subtitle = TextStyle(
  fontSize: 22.0,
  fontFamily: 'Cairo',
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);
const normalText = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Cairo',
  color: Colors.white,
);

const smallText = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Cairo',
  color: kPrimaryColor,
);

const kSloganTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'Cairo',
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

const kStepsFontStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'Cairo',
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(
    color: kGreyColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    fontSize: 16.0);

const KListTileTitle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Cairo',
  color: Colors.black87,
  fontWeight: FontWeight.w700,
);

const KListTileSubtitle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Cairo',
  color: Colors.black54,
  fontWeight: FontWeight.w600,
);

const kRoundedDecoration = InputDecoration(
  labelText: '',
  hintText: '',
  labelStyle: kLabelTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreyColor),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

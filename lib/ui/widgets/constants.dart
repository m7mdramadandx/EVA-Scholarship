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

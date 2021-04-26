import 'dart:ui';

import 'package:countries_app_flutter/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

Color grayColor = new Color(0xffE5E3E3);

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select a country',
          textAlign: TextAlign.center,
          style: TextStyle(color: grayColor),
        ),
      ),
      body: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical * 100,
        child: SizedBox(),
      ),
    );
  }
}

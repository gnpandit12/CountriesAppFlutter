import 'dart:ui';

import 'package:countries_app_flutter/model/CountriesModel.dart';
import 'package:countries_app_flutter/networking/RestApi.dart';
import 'package:countries_app_flutter/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

Color grayColor = new Color(0xffE5E3E3);

class CountryScreen extends StatefulWidget {
  final String region;

  CountryScreen(this.region);

  @override
  _CountryScreenState createState() => _CountryScreenState(region);
}

class _CountryScreenState extends State<CountryScreen> {
  String region;

  _CountryScreenState(this.region);

  @override
  Widget build(BuildContext context) {
    print("Selected Region: ${region}");
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Select a country',
          textAlign: TextAlign.center,
          style: TextStyle(color: grayColor),
        ),
      )),
      body: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          height: SizeConfig.blockSizeVertical * 100,
          child: FutureBuilder<List<CountriesModel>>(
            future: getCountriesFromRegion("europe"),
            builder: (BuildContext context,
                AsyncSnapshot<List<CountriesModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("Connection state done...");
                if (snapshot.hasData) {
                  List<CountriesModel> countriesModelList = snapshot.data;
                } else if (snapshot.hasError) {
                  print("Snapshot Error: ${snapshot.error}");
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                print("Connection state waiting...");
              } else if (snapshot.connectionState == ConnectionState.none) {
                print("Connection state none...");
              }
            },
          )),
    );
  }

  // void __getCountries() {
  //    FutureBuilder<CountriesModel>(
  //     future: getCountriesFromRegion(region),
  //     builder: (BuildContext context, AsyncSnapshot<CountriesModel> snapshot) {
  //       if (snapshot.hasData) {
  //         CountriesModel countriesModel = snapshot.data;
  //         // return _countriesList(countriesModel);
  //       } else if (snapshot.hasError) {
  //         // return Text("${snapshot.error}");
  //       }
  //       // return CircularProgressIndicator();
  //     },
  //   );
  // }

  // ListView _countriesList(CountriesModel countriesModel) {
  //   return ListView.builder(
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //             child: _tile(data[index].employeeName, data[index].employeeSalary,
  //                 Icons.work));
  //       });
  // }

}

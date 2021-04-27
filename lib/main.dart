import 'package:countries_app_flutter/utils/SizeConfig.dart';
import 'package:countries_app_flutter/views/countryScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Color grayColor = new Color(0xffE5E3E3);
Color regionBlueColor = new Color(0xff1075f6);
Color regionPurpleColor = new Color(0xff664199);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select a region',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            'Select a region',
            textAlign: TextAlign.center,
            style: TextStyle(color: grayColor),
          ),
        )),
        body: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          height: SizeConfig.blockSizeVertical * 100,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _navigateToCountriesScreen('asia');
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 8,
                    decoration: BoxDecoration(
                        color: regionBlueColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        'Asia',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _navigateToCountriesScreen('europe');
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 8,
                    decoration: BoxDecoration(
                        color: regionPurpleColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        'Europe',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _navigateToCountriesScreen(String region) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CountryScreen(region)));
  }
}

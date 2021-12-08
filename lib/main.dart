import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/weather.dart';


import 'package:untitled/api.dart';

void main() {
  initializeDateFormatting('ru', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LukWeather',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'LukWeather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Viol = const Color(0xFFE2EBFF);
  var Blue = const Color(0xff038cfe);
  var Date = DateFormat.yMMMMd('ru').format(DateTime.now());
  bool ExpOn = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Hourly>?>(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data;
              log('test', name: 'try');
              // if (_weather == null) {
              //   return CircularProgressIndicator();
              // } else {
              //   return weatherBox(_weather);
              // }
              return Container(color: Colors.amber,);
            }
              return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }

  Widget weatherBox(Current _weather) => MaterialApp(
        theme: ThemeData(
          canvasColor: const Color(0xFFE2EBFF),
        ),
        home: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Luka's Weather",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Manrope-bold',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/Settings.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: const Text(
                                  'Настройки',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/Favourite.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: const Text(
                                  'Избранные',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/AboutUs.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: const Text(
                                  'О Приложении',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Builder(builder: (context) {
            return LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * .6,
              child: ExpandableBottomSheet(
                  background: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: const Image(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      AnimatedPadding(
                        duration: Duration(milliseconds: 1),
                        padding:
                            const EdgeInsets.only(left: 8, top: 35.0, right: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NeumorphicButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 3,
                                      lightSource: LightSource.topLeft,
                                      color: Colors.transparent),
                                  child: NeumorphicIcon(
                                    Icons.menu,
                                    size: 30,
                                  ),
                                ),
                                Column(
                                  children:[
                                    Visibility(
                                      visible: !ExpOn,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 0.0),
                                        child: Text(
                                          "${_weather.temp!.round()}˚c",
                                          style: const TextStyle(
                                            fontSize: 80,
                                            color: Colors.white,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: ExpOn,
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Санкт-Петербург',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: ExpOn,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 50.0),
                                        child: Text(
                                          '${_weather.temp!.round()}˚c',
                                          style: const TextStyle(
                                            fontSize: 80,
                                            color: Colors.white,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !ExpOn,
                                      child: Text(
                                        Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                NeumorphicButton(
                                  onPressed: () {},
                                  style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 3,
                                      lightSource: LightSource.topLeft,
                                      color: Colors.transparent),
                                  child: NeumorphicIcon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onIsContractedCallback: () {
                    setState(() {
                      ExpOn = false;
                    });
                    print(ExpOn);
                  },
                  onIsExtendedCallback: () {
                    setState(() {
                      ExpOn = true;
                    });
                    print(ExpOn);
                  },
                  enableToggle: true,
                  persistentContentHeight: 200,
                  persistentHeader: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      color: Viol,
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/Modalheader.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  expandableContent: Stack(children: [
                    Container(
                        color: Viol,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .6),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 29, right: 29),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '06:00',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/ThunderIcon.png')),
                                            Text(
                                              '10˚c',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '12:00',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/ThunderIcon.png')),
                                            Text(
                                              '12˚c',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '18:00',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/ThunderIcon.png')),
                                            Text(
                                              '14˚c',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '00:00',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/ThunderIcon.png')),
                                            Text(
                                              '11˚c',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                        Visibility(
                            visible: !ExpOn,
                            child: Container(
                                width: 170,
                                height: 40,
                                margin: const EdgeInsets.only(top: 16),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Blue),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Прогноз на неделю",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      color: Blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )))
                      ],
                    ),
                  ])),
            );
          }),
        ),
      );



}

// This trailing comma makes auto-formatting nicer for build methods.

import 'package:flutter/material.dart';
import 'extractor.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return MaterialApp(
      home: SafeArea(child: jsonify()),
    );
  }
}

class jsonify extends StatefulWidget {
  @override
  _jsonifyState createState() => _jsonifyState();
}

class _jsonifyState extends State<jsonify> {
  Map <String, dynamic> b = {"":""};
  Map<String, String> m = {
    "TAMIL NADU": "tn",
    "KERALA": "kl",
    "DELHI": "dl",
    "MAHARASHTRA": "mh",
    "KARNATAKA": "ka",
    "ANDHRA PRADESH": "ap",
    "TELANGANA": "tg",
    "RAJASTHAN": "rj",
    "GUJARAT": "gj",
    "GOA": "ga",
    "ORISSA": "or",
    "HARYANA": "hr",
    "ASSAM": "as"
  };

  String stateChoice = 'tn';
  String stateTitle = 'TAMIL NADU';
  String count = "";

  @override
  void initState() {
    super.initState();
    fetchAlbum().then((a) {
      setState(() {
        b = a;
        count = b[stateChoice];
      });
    });
  }

  FlatButton createButton(String stateName) {
    return FlatButton(
      child: Text(stateName),
      onPressed: () {
        setState(() {
          stateChoice = m[stateName];
          stateTitle = stateName;
          count = b[stateChoice];
          Navigator.pop(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ExpansionTile(
                title: Center(child: Text("STATES")),
                children: <Widget>[
                  createButton('TAMIL NADU'),
                  createButton('KERALA'),
                  createButton('MAHARASHTRA'),
                  createButton('DELHI'),
                  createButton('KARNATAKA'),
                  createButton('RAJASTHAN'),
                  createButton('GUJARAT'),
                  createButton('GOA'),
                  createButton('ANDHRA PRADESH'),
                  createButton('TELANGANA'),
                  createButton('HARYANA'),
                  createButton('ASSAM'),
                  createButton('ORISSA'),
                ],
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/sunset.jpg'),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: ShowUpAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                stateTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kaushan',
                                ),
                              ),
                            ),
                          ),
                        ),
                        animationDuration: Duration(seconds: 2),
                        delayStart: Duration(seconds: 1),
                        curve: Curves.decelerate,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30.0),
                                    child: Text(
                                      'Affected count',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(bottom: 18.0),
                                    child: ShowUpAnimation(
                                      delayStart: Duration(seconds: 2),
                                      animationDuration: Duration(seconds: 3),
                                      curve: Curves.decelerate,
                                      direction: Direction.vertical,
                                      offset: 0.5,
                                      child: Text(
                                        count,
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

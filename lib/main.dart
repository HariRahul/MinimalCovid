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
  Map<String, dynamic> parsedData = {"": ""};
  Map<String, String> indiaStates = {
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
    "ODISHA": "or",
    "HARYANA": "hr",
    "ASSAM": "as",
    "PUNJAB": "pb",
    "UTTAR PRADESH": "up",
    "MADHYA PRADESH": "mp",
    "WEST BENGAL": "wb",
    "BIHAR": "br",
    "JAMMU AND KASHMIR": "jk",
    "UTTARAKHAND": "ut",
    "JHARKHAND": "jh",
    "CHHATTISGARH": "ct",
    "CHANDIGARH": "ch",
    "TRIPURA": "tr",
    "HIMACHAL PRADESH": "hp",
    "LADAKH": "la",
    "MANIPUR": "mn",
    "PUDHUCHERRY":"py",
    "NAGALAND": "nl",
    "MIZORAM": "mz",
    "ARUNACHAL PRADESH": "ar",
    "SIKKIM": "sk",
    "MEGHALAYA": "ml",
    "ANDAMAN AND NICOBAR": "an",
    "DAMAN AND DIU": "dd",
    "DADRA AND NAGAR HAVELI": "dn"
  };

  String stateChoice = 'tn';
  String stateTitle = 'TAMIL NADU';
  String count = "";

  @override
  void initState() {
    super.initState();
    fetchAlbum().then((a) {
      setState(() {
        parsedData = a;
        count = parsedData[stateChoice];
      });
    });
  }

  FlatButton createButton(String stateName) {
    return FlatButton(
      child: Text(stateName),
      onPressed: () {
        setState(() {
          stateChoice = indiaStates[stateName];
          stateTitle = stateName;
          count = parsedData[stateChoice];
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
                  createButton('UTTAR PRADESH'),
                  createButton('PUNJAB'),
                  createButton('MADHYA PRADESH'),
                  createButton('WEST BENGAL'),
                  createButton('BIHAR'),
                  createButton('JAMMU AND KASHMIR'),
                  createButton('UTTARAKHAND'),
                  createButton('JHARKHAND'),
                  createButton('CHHATTISGARH'),
                  createButton('CHANDIGARH'),
                  createButton('TRIPURA'),
                  createButton('HIMACHAL PRADESH'),
                  createButton('LADAKH'),
                  createButton('MANIPUR'),
                  createButton('PUDHUCHERRY'),
                  createButton('NAGALAND'),
                  createButton('MIZORAM'),
                  createButton('ARUNACHAL PRADESH'),
                  createButton('SIKKIM'),
                  createButton('MEGHALAYA'),
                  createButton('ANDAMAN AND NICOBAR'),
                  createButton('DAMAN AND DIU'),
                  createButton('DADRA AND NAGAR HAVELI'),
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                    onPressed: () {
                      fetchAlbum().then((a) {
                        setState(() {
                          parsedData = a;
                          count = parsedData[stateChoice];
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

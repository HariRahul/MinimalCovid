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
    "Tamil Nadu": "tn",
    "Kerala": "kl",
    "Delhi": "dl",
    "Maharashtra": "mh",
    "Karnataka": "ka",
    "Andhra Pradesh": "ap",
    "Telangana": "tg",
    "Rajasthan": "rj",
    "Gujarat": "gj",
    "Goa": "ga",
    "Odisha": "or",
    "Haryana": "hr",
    "Assam": "as",
    "Punjab": "pb",
    "Uttar Pradesh": "up",
    "Madhya Pradesh": "mp",
    "West Bengal": "wb",
    "Bihar": "br",
    "Jammu and Kashmir": "jk",
    "Uttarakhand": "ut",
    "Jharkhand": "jh",
    "Chhattisgarh": "ct",
    "Chandigarh": "ch",
    "Tripura": "tr",
    "Himachal Pradesh": "hp",
    "Ladakh": "la",
    "Manipur": "mn",
    "Puducherry":"py",
    "Nagaland": "nl",
    "Mizoram": "mz",
    "Arunachal Pradesh": "ar",
    "Sikkim": "sk",
    "Meghalaya": "ml",
    "Andaman and Nicobar Islands": "an"
  };

  String stateChoice = 'tn';
  String stateTitle = 'Tamil Nadu';
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
                  createButton('Tamil Nadu'),
                  createButton('Kerala'),
                  createButton('Maharashtra'),
                  createButton('Delhi'),
                  createButton('Karnataka'),
                  createButton('Rajasthan'),
                  createButton('Gujarat'),
                  createButton('Goa'),
                  createButton('Andhra Pradesh'),
                  createButton('Telangana'),
                  createButton('Haryana'),
                  createButton('Assam'),
                  createButton('Odisha'),
                  createButton('Uttar Pradesh'),
                  createButton('Punjab'),
                  createButton('Madhya Pradesh'),
                  createButton('West Bengal'),
                  createButton('Bihar'),
                  createButton('Jammu and Kashmir'),
                  createButton('Uttarakhand'),
                  createButton('Jharkhand'),
                  createButton('Chhattisgarh'),
                  createButton('Chandigarh'),
                  createButton('Tripura'),
                  createButton('Himachal Pradesh'),
                  createButton('Ladakh'),
                  createButton('Manipur'),
                  createButton('Puducherry'),
                  createButton('Nagaland'),
                  createButton('Mizoram'),
                  createButton('Arunachal Pradesh'),
                  createButton('Sikkim'),
                  createButton('Meghalaya'),
                  createButton('Andaman and Nicobar Islands')
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

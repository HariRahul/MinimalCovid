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
  String b = '';
  String stateChoice = 'tn';
  String stateTitle = 'TAMIL NADU';
  Map<String, String> m = {
    "TAMIL NADU": "tn",
    "KERALA": "kl",
    "DELHI": "dl",
    "MAHARASHTRA": "mh",
    "KARNATAKA": "ka"
  };

  FlatButton createButton(String stateName) {
    return FlatButton(
      child: Text(stateName),
      onPressed: () {
        setState(() {
          stateChoice = m[stateName];
          stateTitle = stateName;
          Navigator.pop(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchAlbum(stateChoice).then((a) {
      setState(() {
        b = a;
      });
    });

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
                    flex: 3,
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
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 30.0),
                                      child: Text(
                                        'Affected count',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20.0),
                                      child: ShowUpAnimation(
                                        delayStart: Duration(seconds: 2),
                                        animationDuration: Duration(seconds: 3),
                                        curve: Curves.decelerate,
                                        direction: Direction.vertical,
                                        offset: 0.5,
                                        child: Text(
                                          b,
                                          style: TextStyle(
                                            fontSize: 50.0,
                                            color: Colors.orangeAccent,
                                          ),
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

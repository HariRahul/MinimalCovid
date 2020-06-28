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
    //Lock autorotate
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Set notification bar colour
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
  Map<String, dynamic> parsedData = {};
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
    "Puducherry": "py",
    "Nagaland": "nl",
    "Mizoram": "mz",
    "Arunachal Pradesh": "ar",
    "Sikkim": "sk",
    "Meghalaya": "ml",
    "Andaman and Nicobar Islands": "an"
  };
  Map<String, dynamic> parsedDataDistrict = {};
  List<String> stateDistricts = [];
  List<String> stateNames = [];
  String dateState = '';
  String stateChoice = 'tn';
  String stateTitle = 'Tamil Nadu';
  String districtName = '';
  String countState = "";
  int countDistrict = 0;
  List<dynamic> datas = [];

  @override
  void initState() {
    super.initState();

    fetchStates().then((a) {
      setState(() {
        parsedData = a;
        countState = parsedData[stateChoice];
        dateState = parsedData['date'];

        indiaStates.forEach((key, value) {
          stateNames.add(key);
        });
      });
    });

    fetchDistricts().then((a) {
      setState(() {
        parsedDataDistrict = a;
        parsedDataDistrict[stateTitle]
            .forEach((key, value) => stateDistricts.add(key));

        districtButtons(stateDistricts);
        districtName = stateDistricts[0];

        datas = parsedDataDistrict[stateTitle][districtName];

        countDistrict = datas[datas.length - 2]['confirmed'];
      });
    });
  }

  List<FlatButton> stateButtons() {
    List<FlatButton> temporaryButtons = [];
    stateNames
        .forEach((element) => temporaryButtons.add(createButton(element)));
    return temporaryButtons;
  }

  List<FlatButton> districtButtons(List<String> districts) {
    List<FlatButton> temporaryButtons = [];
    districts.forEach(
        (element) => temporaryButtons.add(createButtonDistricts(element)));
    return temporaryButtons;
  }

  FlatButton createButton(String stateName) {
    return FlatButton(
      child: Text(stateName),
      onPressed: () {
        setState(() {
          stateChoice = indiaStates[stateName];

          stateTitle = stateName;

          countState = parsedData[stateChoice];

          stateDistricts.clear();
          parsedDataDistrict[stateTitle]
              .forEach((key, value) => stateDistricts.add(key));
          districtButtons(stateDistricts);

          districtName = stateDistricts[0];

          datas = parsedDataDistrict[stateTitle][districtName];
          countDistrict = datas[datas.length - 1]['confirmed'];

          Navigator.pop(context);
        });
      },
    );
  }

  FlatButton createButtonDistricts(String stateName) {
    return FlatButton(
      child: Text(stateName),
      onPressed: () {
        setState(() {
          datas = parsedDataDistrict[stateTitle][stateName];
          districtName = stateName;
          countDistrict = datas[datas.length - 1]['confirmed'];
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
                children: stateButtons(),
              ),
              ExpansionTile(
                title: Center(child: Text('DISTRICTS')),
                children: districtButtons(stateDistricts),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            children: <Widget>[
                              Text(
                                stateTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kaushan',
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                dateState,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kaushan',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Container(
                                      child: Text(
                                        'Total',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Container(
                                      child: Text(
                                        countState,
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          color: Colors.orange,
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
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Container(
                                      child: Text(
                                        districtName,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Container(
                                      child: Text(
                                        countDistrict.toString(),
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          color: Colors.orange,
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
                    ],
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
                      fetchStates().then((a) {
                        setState(() {
                          parsedData = a;
                          countState = parsedData[stateChoice];
                          dateState = parsedData['date'];
                        });
                      });
                      fetchDistricts().then((a) {
                        setState(() {
                          parsedDataDistrict = a;
                          parsedDataDistrict[stateTitle]
                              .forEach((key, value) => stateDistricts.add(key));

                          districtButtons(stateDistricts);
                          districtName = stateDistricts[0];

                          datas = parsedDataDistrict[stateTitle][districtName];
                          countDistrict =
                              datas[datas.length - 2]['confirmed'];
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

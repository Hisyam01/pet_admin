import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'menuutamaservices.dart';

class SearchPetShop extends StatefulWidget {
  @override
  _SearchPetShopState createState() => _SearchPetShopState();
}

class _SearchPetShopState extends State<SearchPetShop> {
  bool isLoaded = false;
  double lat = -6.541152;
  double long = 106.780741;
  String search;
  String _selectedLocation;
  bool location = false;
  List _locationLists = [
    'Jakarta',
    'Bandung',
    'Bogor',
  ];
  Position _currentPosition;
  bool _initialized = false;
  bool _error = false;
  List test = [];
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  List testing() {
    _getCurrentLocation();
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        lat = position.latitude;
        long = position.longitude;
      });
    }).then((value) {
      List hasil = [];
      CollectionReference users =
      FirebaseFirestore.instance.collection('Petshop List');
      users.get().then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((data) {
          final Map<String, dynamic> someMap = {
            "name": data['name'],
            "location": data['location'],
            "rating": data['rating'],
            "image": data['image'],
            "lat": data["lat"],
            "long": data["long"],
            "distance":
            calculateDistance(lat, long, data['lat'], data['long'])
          };
          hasil.add(someMap);
          setState(() {
            test = hasil;
          });
          Iterable printTest = test.where(
                  (element) => element['name'].toLowerCase().contains(''));
          setState(() {
            result = printTest.toList();
          });
        })
      });
    }).catchError((e) {
      print(e);
    });
  }

  List result = [];
  Map query = {
    'name': '',
    'location': '',
    'rating': 0,
  };
  void cari() {
    Iterable printTest = test
        .where((element) => element['name']
        .toLowerCase()
        .contains(query['name'].toString().toLowerCase()))
        .where((element) => element['location']
        .toLowerCase()
        .contains(query['location'].toString().toLowerCase()))
        .where((element) => element['rating']
        .toString()
        .contains(query['rating'] == 0 ? '' : query['rating'].toString()));
    setState(
          () {
        result = printTest.toList();
      },
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(test);
    Size size = MediaQuery.of(context).size;
    print(_currentPosition);
    if (!isLoaded) {
      if (!_initialized) {
        print('loading');
      } else {
        setState(() {
          isLoaded = true;
        });
        print('success');
        testing();
      }

      if (_error) {
        print('error');
      }
    }
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      body: Container(
        width: size.width,
        height: size.height + 2000,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 123,
                  color: HexColor('#8BCDCD'),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
                // FlatButton(
                //   onPressed: () {
                //     setState(() {
                //       result.sort(
                //           (a, b) => a['distance'].compareTo(b['distance']));
                //     });
                //   },
                //   child: Text('Hello World'),
                // )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 35, 20, 0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#8BCDCD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  onSubmitted: (value) {
                                    setState(() {
                                      query['name'] = search;
                                    });
                                    cari();
                                  },
                                  onChanged: (e) {
                                    setState(
                                          () {
                                        search = e;
                                      },
                                    );
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          query['name'] = search;
                                        });
                                        cari();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['location'] = '';
                        query['rating'] = 0;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        result.sort(
                                (a, b) => a['distance'].compareTo(b['distance']));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Text(
                        'Nearby',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        location = !location;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['rating'] = 1;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/star.png'),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['rating'] = 2;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/star.png'),
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['rating'] = 3;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/star.png'),
                          ),
                          Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['rating'] = 4;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/star.png'),
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        query['rating'] = 5;
                        cari();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: HexColor('#3797A4'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/star.png'),
                          ),
                          Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            location == true
                ? Container(
              padding: const EdgeInsets.only(left: 22),
              width: double.infinity,
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(hintText: ''),
                isExpanded: true,
                hint: Text("Pilih Lokasi"),
                value: _selectedLocation,
                items: _locationLists.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(
                        () {
                      setState(() {
                        query['location'] = value;
                      });
                      cari();
                    },
                  );
                },
              ),
            )
                : SizedBox(
              height: 0,
              width: 0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 0,
              ),
              width: double.infinity,
              height: size.height - 320,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: result == []
                          ? ''
                          : result.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return MyHomePage(
                                    text: e['name'],
                                  );
                                }));
                          },
                          child: Container(
                            height: 180,
                            width: 177,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/${e['image']}.jpg'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: HexColor('#8BCDCD'),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    height: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/star.png'),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(e['rating'].toString()),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text('•'),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(e['location']),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Text(
                                              e['distance']
                                                  .toString()
                                                  .split('.')[0] +
                                                  ' km',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
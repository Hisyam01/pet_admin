import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuProductGrooming extends StatefulWidget {
  final String text;
  MenuProductGrooming({Key key, @required this.text}) : super(key: key);
  @override
  _MenuProductGroomingState createState() => _MenuProductGroomingState();
}

class _MenuProductGroomingState extends State<MenuProductGrooming> {
  final db = FirebaseFirestore.instance;
  List test = [];

  void getData() {
    List hasil = [];
    CollectionReference users = FirebaseFirestore.instance
        .collection("/Produk & Service/${widget.text}/pGrooming");
    users.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((data) {
            final Map<String, dynamic> someMap = {
              'item': data['item'],
              'harga': data['harga'],
              'img': data['img'],
            };
            hasil.add(someMap);
            setState(() {
              test = hasil;
            });
            print(test);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    // mapData();
    var NamaToko = 'Abadi Jaya';
    return Scaffold(
      body: Column(children: [
        Container(
          color: HexColor('#8BCDCD'),
          height: 130,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100, width: 80),
              // Container(
              //     // color: Colors.white,
              //     child: Text(
              //       NamaToko,
              //       style: TextStyle(color: Colors.red),
              //     ),
              //     decoration: BoxDecoration(
              //         color: HexColor('#FFFFFF'),
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(2),
              //         ))),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 50,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: new EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
            child: Column(
              children: [
                Center(child: Image.asset('assets/PGROOMING_011.png')),
                Center(
                  child: Text(
                    'PRODUK GROOMING',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 31,
                ),
                Text(
                  'Kami menjual berbagai macam produk grooming dengan kualitas terbaik untuk peliharaan Anda.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 31,
                ),
                Column(
                  // alignment: WrapAlignment.center,
                  // spacing: 10.0,
                  // runSpacing: 10.0,
                  children: test == []
                      ? ''
                      : test.map((e) {
                          return Column(
                            children: [
                              Container(
                                height: 120,
                                width: 300,
                                // color: Colors.amber,
                                // decoration: BoxDecoration(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/${e['img']}.png'),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: new EdgeInsets.fromLTRB(
                                            22.0, 0, 25.0, 22.0),
                                        width: double.infinity,
                                        // color: Colors.red,
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['item'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              e['harga'].toString() + '/pc',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// getPGrooming(AsyncSnapshot<QuerySnapshot> snapshot) {
//   return snapshot.data.docs
//       .map((doc) => new ListTile(
//           title: new Text(doc["item"]),
//           subtitle: new Text(doc["harga"].toString())))
//       .toList();
// }

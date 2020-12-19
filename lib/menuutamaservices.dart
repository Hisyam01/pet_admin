import 'menuaksesoris.dart';
import 'menugrooming.dart';
import 'menukandang.dart';
import 'menuproductgrooming.dart';
import 'menutoys.dart';
import 'menuvaksinasi.dart';
import 'menufoodandvitamin.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  final String text;
  MyHomePage({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(text);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: HexColor('#8BCDCD'),
            height: 130,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/logo.png')],
            ),
          ),
          Row(
            children: [
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
                child: Container(
                  child: SizedBox(
                    width: 200,
                    child: Container(
                      padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: Text(
                        "FACILITIES",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
              )
            ],
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: new EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/MenuGrooming.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuGrooming(
                              text: text,
                            );
                          }));
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/MenuGroomProducts.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuProductGrooming(
                              text: text,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/MenuVaksin.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuVaksin(
                              text: text,
                            );
                          }));
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/MenuFoodVitamin.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuFoodAndVitamin(
                              text: text,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/MenuToys.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuToys(
                              text: text,
                            );
                          }));
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/MenuAksesoris.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuAksesoris(
                              text: text,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/MenuKandang.png'),
                        iconSize: 150,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuKandang(
                              text: text,
                            );
                          }));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

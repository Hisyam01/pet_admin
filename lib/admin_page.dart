import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/auth_services.dart';
import 'package:flutterfirebaseauth/dokter_list.dart';
import 'package:flutterfirebaseauth/login_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutterfirebaseauth/update_petshop.dart';

class AdminPage extends StatelessWidget {
  final User user;

  AdminPage({this.user});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: HexColor("#8dcad2"),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 0, left: 0, top: 130),
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16, top: 0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        children: <Widget>[
                          Text(
                            'Hello Admin.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Do you have something new for me?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Image.asset('assets/icons/updatepetshop.jpeg',
                                  width: 100,
                                  height: 100,
                                ),

                                Text('Update Petshop',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          //Widget Keuda
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.asset('assets/icons/fasilitas.jpeg',
                                width: 100,
                                height: 100,
                              ),
                              new Text('Update Pet Facilities',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          //Widget Ketiga
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => DoctorList()));
                            },
                            //Widget Pertama
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.asset('assets/icons/doctor.jpeg',
                                width: 90,
                                height: 90,
                              ),
                              new Text('List Dokter',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          ),
                          //Widget keempat
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.asset('assets/icons/resetuser.jpeg',
                                width: 90,
                                height: 90,
                              ),
                              new Text('Reset Password Admin',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          //Widget Ketiga
                        ],
                      ),
                      SizedBox(height: 30),
                    ]),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () async {
                            // sign out google
                            AuthServices.signOutGoogle();

                            // sign out
                            AuthServices.signOut();

                            // go to login page
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                                    (route) => false);
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Color(0xFF4f4f4f),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

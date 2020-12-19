import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuToys extends StatefulWidget {
  final String text;
  MenuToys({Key key, @required this.text}) : super(key: key);
  @override
  _MenuToysState createState() => _MenuToysState();
}

class _MenuToysState extends State<MenuToys> {
  final db = FirebaseFirestore.instance;
  List test = [];

  void getData() {
    List hasil = [];
    CollectionReference users = FirebaseFirestore.instance
        .collection("/Produk & Service/${widget.text}/Mainan");
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
              Image.asset('assets/logo.png'),
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
                Center(child: Image.asset('assets/MAINAN1.png')),
                Center(
                  child: Text(
                    'MAINAN',
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
                  'Kami menjual berbagai macam alat dan mainan untuk hewan peliharaan Anda',
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
                                height: 100,
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
                                        height: 60,
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
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              e['harga'].toString(),
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

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class MenuToys extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             color: HexColor('#8BCDCD'),
//             height: 130,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [Image.asset('assets/logo.png')],
//             ),
//           ),
//           Container(
//             alignment: Alignment.topLeft,
//             child: IconButton(
//               icon: Icon(Icons.arrow_back),
//               iconSize: 50,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: new EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
//               child: Column(
//                 children: [
//                   // Mainan Start
//                   Center(child: Image.asset('assets/MAINAN1.png')),
//                   Center(
//                     child: Text(
//                       'MAINAN',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 31,
//                   ),
//                   Text(
//                     'Kami menjual berbagai macam alat dan mainan untuk hewan peliharaan Anda.',
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 31,
//                   ),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/MAINAN_01.png'),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Rubber Sponge Ball ',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 20.000/pc',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/MAINAN_02.png'),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Bola Kerincing ',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 10.000/pc',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/MAINAN_03.png'),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Squeaky Rubber Bone',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 20.000/pc',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/MAINAN_04.png'),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Circular Turntable Cat Toy ',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 85.000/pc',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   //           // Mainan End
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

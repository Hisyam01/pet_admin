import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuGrooming extends StatefulWidget {
  final String text;
  MenuGrooming({Key key, @required this.text}) : super(key: key);
  @override
  _MenuGroomingState createState() => _MenuGroomingState();
}

class _MenuGroomingState extends State<MenuGrooming> {
  final db = FirebaseFirestore.instance;
  List test = [], test1 = [], test2 = [], test3 = [];

  void getData() {
    List hasil = [];
    CollectionReference users = FirebaseFirestore.instance
        .collection("/Produk & Service/${widget.text}/Grooming");
    users.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((data) {
            final Map<String, dynamic> someMap = {
              'item': data['item'],
              'harga1': data['harga1'],
              'harga2': data['harga2'],
              'desc': data['desc'],
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
    // getDataGroomingCat();
    // getDataCukurDog();
    // getDataGroomingDog();
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
                Center(child: Image.asset('assets/CAT 1.png')),
                Center(
                  child: Text(
                    'CAT GROOMING',
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
                  'Groomer bersertifikat kami siap membuat hidup Anda sedikit lebih mudah dan membuat Kucing atau Anak Kucing Anda terlihat bersih dan sempurna.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 31,
                ),
                Row(
                  children: [
                    Text(
                      'HARGA GROOMING',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.stretch,
                                  // // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // padding: new EdgeInsets.fromLTRB(z
                                        //     22.0, 0, 25.0, 22.0),
                                        width: double.infinity,
                                        // color: Colors.red,
                                        height: 500,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['item'].toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#3797A4'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        e['desc'].toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      e['harga1'] + ' (Kucing)',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      e['harga2'] + ' (Anjing)',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                // Row(
                //   children: [
                //     Text(
                //       'HARGA CUKUR',
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 31,
                // ),
                // Column(
                //   // alignment: WrapAlignment.center,
                //   // spacing: 10.0,
                //   // runSpacing: 10.0,
                //   children: test == []
                //       ? ''
                //       : test1.map((e) {
                //           return Column(
                //             children: [
                //               Container(
                //                 height: 70,
                //                 width: 300,
                //                 // color: Colors.amber,
                //                 // decoration: BoxDecoration(),

                //                 child: Row(
                //                   // crossAxisAlignment:
                //                   //     CrossAxisAlignment.stretch,
                //                   // // mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [
                //                     Expanded(
                //                       child: Container(
                //                         // padding: new EdgeInsets.fromLTRB(z
                //                         //     22.0, 0, 25.0, 22.0),
                //                         width: double.infinity,
                //                         // color: Colors.red,
                //                         height: 500,
                //                         child: Column(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               e['harga'],
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                             Text(
                //                               e['item'].toString(),
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           );
                //         }).toList(),
                // ),
                // Center(child: Image.asset('assets/DOG.png')),
                // Center(
                //   child: Text(
                //     'DOG GROOMING',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 31,
                // ),
                // Row(
                //   children: [
                //     Text(
                //       'HARGA GROOMING',
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 31,
                // ),
                // Column(
                //   // alignment: WrapAlignment.center,
                //   // spacing: 10.0,
                //   // runSpacing: 10.0,
                //   children: test2 == []
                //       ? ''
                //       : test2.map((e) {
                //           return Column(
                //             children: [
                //               Container(
                //                 height: 150,
                //                 width: 300,
                //                 // color: Colors.amber,
                //                 // decoration: BoxDecoration(),

                //                 child: Row(
                //                   // crossAxisAlignment:
                //                   //     CrossAxisAlignment.stretch,
                //                   // // mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [
                //                     Expanded(
                //                       child: Container(
                //                         // padding: new EdgeInsets.fromLTRB(z
                //                         //     22.0, 0, 25.0, 22.0),
                //                         width: double.infinity,
                //                         // color: Colors.red,
                //                         height: 500,
                //                         child: Column(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               e['item'].toString(),
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                             Text(
                //                               e['harga1'],
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                             Text(
                //                               e['harga2'],
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                             SizedBox(
                //                               height: 5,
                //                             ),
                //                             Text(
                //                               e['desc'].toString(),
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           );
                //         }).toList(),
                // ),
                // Row(
                //   children: [
                //     Text(
                //       'HARGA CUKUR',
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 31,
                // ),
                // Column(
                //   // alignment: WrapAlignment.center,
                //   // spacing: 10.0,
                //   // runSpacing: 10.0,
                //   children: test3 == []
                //       ? ''
                //       : test3.map((e) {
                //           return Column(
                //             children: [
                //               Container(
                //                 height: 150,
                //                 width: 300,
                //                 // color: Colors.amber,
                //                 // decoration: BoxDecoration(),

                //                 child: Row(
                //                   // crossAxisAlignment:
                //                   //     CrossAxisAlignment.stretch,
                //                   // // mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [
                //                     Expanded(
                //                       child: Container(
                //                         // padding: new EdgeInsets.fromLTRB(z
                //                         //     22.0, 0, 25.0, 22.0),
                //                         width: double.infinity,
                //                         // color: Colors.red,
                //                         height: 500,
                //                         child: Column(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               e['harga'],
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                             Text(
                //                               e['item'].toString(),
                //                               textAlign: TextAlign.center,
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           );
                //         }).toList(),
                // ),
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

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class MenuGrooming extends StatelessWidget {
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
//           Column(
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   iconSize: 30,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: new EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
//               child: Column(
//                 children: [
//                   Image.asset('assets/CAT 1.png'),
//                   Text(
//                     'CAT GROOMING',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 31,
//                   ),
//
//                   SizedBox(
//                     height: 31,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.only(left: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'HARGA GROOMING',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Mandi Basic ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo untuk kulit normal disertai Conditioner pada bulu Kucing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 50000/ kucing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 100000/ kucing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     'Mandi Jamur ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo khusus Jamur disertai Conditioner pada bulu Kucing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 80000/ kucing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 150000/ kucing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     'Mandi Kutu ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo khusus Kutu disertai Conditioner pada bulu Kucing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 80000/ kucing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 150000/ kucing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),

//                         // HARGA CUKUR
//                         Text(
//                           'HARGA CUKUR',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Cukur Pendek/ Botak  ',
//                           style: TextStyle(
//                             color: HexColor('#3797A4'),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Kucing Kecil',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Kucing Sedang',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Kucing Besar',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 60000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 70000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 80000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 31,
//                         ),
//                         // Dog Grooming Start
//                         Center(child: Image.asset('assets/DOG.png')),
//                         Center(
//                           child: Text(
//                             'DOG GROOMING',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 31,
//                         ),
//                         Text(
//                           'Groomer bersertifikat kami siap membuat hidup Anda sedikit lebih mudah dan membuat Anjing atau Anak Anjing Anda terlihat bersih dan sempurna.',
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 31,
//                         ),

//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     'Mandi Jamur ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo khusus Jamur disertai Conditioner pada bulu Anjing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 80000/ Anjing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 150000/ Anjing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     'Mandi Jamur ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo khusus Jamur disertai Conditioner pada bulu Anjing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 80000/ Anjing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 150000/ Anjing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     'Mandi Kutu ',
//                                     style: TextStyle(
//                                       color: HexColor('#3797A4'),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Grooming dengan menggunakan Shampoo khusus Kutu disertai Conditioner pada bulu Anjing Anda.',
//                                     style: TextStyle(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 80000/ Anjing kecil',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 150000/ Anjing besar',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),

//                         // HARGA CUKUR
//                         Text(
//                           'HARGA CUKUR',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Cukur Pendek/ Botak  ',
//                           style: TextStyle(
//                             color: HexColor('#3797A4'),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Anjing Kecil',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Anjing Sedang',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Anjing Besar',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Rp. 60000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 70000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Rp. 80000',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         //           // Dog Grooming End
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

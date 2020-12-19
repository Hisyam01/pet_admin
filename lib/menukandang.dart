import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase Plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuKandang extends StatefulWidget {
  final String text;
  MenuKandang({Key key, @required this.text}) : super(key: key);
  @override
  _MenuKandangState createState() => _MenuKandangState();
}

class _MenuKandangState extends State<MenuKandang> {
  final db = FirebaseFirestore.instance;
  List test = [];

  void getData() {
    List hasil = [];
    CollectionReference users = FirebaseFirestore.instance
        .collection("/Produk & Service/${widget.text}/Kandang");
    users.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((data) {
            final Map<String, dynamic> someMap = {
              'item': data['item'],
              'harga': data['harga'],
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
                Center(child: Image.asset('assets/KANDANG1.png')),
                Center(
                  child: Text(
                    'KANDANG',
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
                  'Kami menjual kandang untuk kenyamanan peliharaan Anda',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
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
                                height: 80,
                                width: 400,
                                // color: Colors.amber,
                                // decoration: BoxDecoration(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: new EdgeInsets.fromLTRB(
                                            22.0, 0, 25.0, 0),
                                        width: double.infinity,
                                        // color: Colors.red,
                                        height: double.infinity,
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      e['harga'].toString(),
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

// class MenuVaksin extends StatelessWidget {
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
//               padding: new EdgeInsets.all(25.0),
//               child: Column(
//                 children: [
//                   // Vaksinasi Start
//                   Center(child: Image.asset('assets/VAKSIN1.png')),
//                   Center(
//                     child: Text(
//                       'VAKSINASI',
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
//                     'Kami menyediakan layanan suntik vaksin kesehatan untuk peliharaan sesuai resep para dokter dan ahli di bidangnya.',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Rabisin Vaccine ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Vaksin Anjing, Kucing, dan Kelinci untuk menjaga kesehatan peliharaan.',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 85000/ dose',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Eurican6 Vaccine ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Vaksin Anjing, Kucing, dan Kelinci untuk menjaga imun tubuh peliharaan.',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 200000/ dose',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Mectine Tablet ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Vaksin Anjing, Kucing, dan Kelinci untuk mencegah parasit dalam tubuh peliharaan.',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 150000/ dose',
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
//                   Text(
//                     'PAKET HEMAT',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Eurican6 + Rabisin ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 250000/ dose',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Eurican6 + Rabisin + Mectine',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 400000/ dose',
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
//                   //Vaksinasi End
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class MenuAksesoris extends StatelessWidget {
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
//                   // Aksesoris Start
//                   Center(child: Image.asset('assets/AKSESORIS1.png')),
//                   Center(
//                     child: Text(
//                       'AKSESORIS',
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
//                     'Kami menjual berbagai macam aksesoris untuk peliharaan kesayangan Anda.',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Kalung Anjing / Kucing ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Uk. Lingkar Kalung: 22 - 38 cm',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 15.000/pc',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Tali Kalung Anjing / Kucing ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Tali Kalung + Kalung ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 30.000/pc',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Dog Tag Stainless Steel ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 15.000/pc',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Custom Dog Tag',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Bahan : Stainless Steel Premium',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 25.000/pc',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Carrier Bag ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 100.000/pc',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Pet Cargo Carrier',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
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
//                               'Rp. 135.000/pc',
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
//                   //           // Aksesoris End
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class MenuKandang extends StatelessWidget {
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
//                   //  Kandang Start
//                   Center(child: Image.asset('assets/KANDANG1.png')),
//                   Center(
//                     child: Text(
//                       'KANDANG',
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
//                     'Kami menjual kandang untuk Anjing, Kucing, Kelinci dan Hamster untuk kenyamanan peliharaan anda.',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Hamster/Rabbit Cage  ',
//                               style: TextStyle(
//                                 color: HexColor('#FF8A00'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Text(
//                               'Hamster  ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Uk. Kandang: 35 x 25 x 30 cm',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 100.000',
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
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Cat Cage  ',
//                               style: TextStyle(
//                                 color: HexColor('#FF8A00'),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Text(
//                               'Cat Ocatgon Full Cage  ',
//                               style: TextStyle(
//                                 color: HexColor('#3797A4'),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Uk. Kandang: 60 x 43 x 50 cm',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Rp. 85000/ dose',
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

//                   //Kandang End
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

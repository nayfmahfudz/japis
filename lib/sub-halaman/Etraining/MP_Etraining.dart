import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:japis_new/sub-halaman/Efacility/DetailBravo.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailElelim.dart';
import 'package:japis_new/sub-halaman/Efacility/FormSewaFasilitas.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailBasket.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailFutsal.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailSerbaguna.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailMarshalling.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailMarshalling.dart';

// ignore: must_be_immutable
class Etraining extends StatelessWidget {
  @override
  String imageurl;
  Future _future;
  Future semua() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/training";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    print(jsondata);
    imageurl = jsondata["assets_uri"].toString();
    return jsondata;
  }

  Future asrama() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  Future pertemuan() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  Future olahraga() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('E-Facility')),
        body: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF44D8F3),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Efacility()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Image.asset('gambar/mp-etraining-100px.png'),
                  color: Color(0xFF44D8F3),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 23, top: 15, bottom: 5),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                // Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Image.asset("gambar/stadium.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Keamanan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                // Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Image.asset("gambar/pertemuan.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "BandarUdara",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                // Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Image.asset("gambar/asrama.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Navigasi",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                // Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Image.asset("gambar/asrama.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Jasa Instruktur",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: FutureBuilder(
                    future: semua(),
                    builder: (context, snapshot) {
                      if (snapshot.data["data"] == null) {
                        return Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        List listdata = snapshot.data["data"];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount:
                                listdata.length == 0 ? 1 : listdata.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: CardData(listdata[index], imageurl),
                              );
                            },
                          ),
                        );
                      }
                    }),
              )
              // Container(
              //   padding: EdgeInsets.only(left: 15, right: 15),
              //   child: Column(
              //     children: [
              //       Card(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const ListTile(
              //               leading: Icon(Icons.sports_soccer),
              //               title: Text('Lapangan Futsal'),
              //               subtitle: Text('Sewa: per jam'),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 TextButton(
              //                   child: const Text('Detail'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => DetailFutsal()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //                 TextButton(
              //                   child: const Text('Sewa'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => FormSewa()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       Card(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const ListTile(
              //               leading: Icon(Icons.sports_basketball),
              //               title: Text('Lapangan Basket'),
              //               subtitle: Text('Sewa: per jam'),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 TextButton(
              //                   child: const Text('Detail'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => DetailBasket()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //                 TextButton(
              //                   child: const Text('Sewa'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => FormSewa()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       Card(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const ListTile(
              //               leading: Icon(Icons.business),
              //               title: Text('Gedung Serbaguna'),
              //               subtitle: Text('Sewa: per 4 jam'),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 TextButton(
              //                   child: const Text('Detail'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) =>
              //                                 DetailSerbaguna()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //                 TextButton(
              //                   child: const Text('Sewa'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => FormSewa()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       Card(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const ListTile(
              //               leading: Icon(Icons.business),
              //               title: Text('Asrama Elelim'),
              //               subtitle: Text('Sewa: orang per kamar per hari'),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 TextButton(
              //                   child: const Text('Detail'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => DetailElelim()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //                 TextButton(
              //                   child: const Text('Sewa'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => FormSewa()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       Card(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const ListTile(
              //               leading: Icon(Icons.business),
              //               title: Text('Asrama Bravo'),
              //               subtitle: Text('Sewa: orang per kamar per hari'),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 TextButton(
              //                   child: const Text('Detail'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => DetailBravo()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //                 TextButton(
              //                   child: const Text('Sewa'),
              //                   onPressed: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => FormSewa()));
              //                   },
              //                 ),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}

class CardData extends StatelessWidget {
  CardData(this.data, this.imageurl);
  Map data;
  String imageurl;
  List<String> foto;
  @override
  Widget build(BuildContext context) {
    foto = data["foto_layanan"].toString().split(",");
    // print(data["foto_layanan"].toString().split(","));
    return AspectRatio(
      aspectRatio: 2.5,
      child: Container(
        // margin: EdgeInsets.all(10),
        // height: MediaQuery.of(context).size.height * 0.18,
        // width: MediaQuery.of(context).size.width / 3,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.network(
                      imageurl + foto[0].toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(data["nama_layanan"],
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Expanded(
                          child: Text("Rp. " + data["tarif"] + " -/Diklat",
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF44D8F3),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonTheme(
                                minWidth: 70,
                                height: 30,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailEtraining(data, imageurl,
                                                    foto, "training")));
                                  },
                                  textColor: Colors.white,
                                  color: Color(0xFF44D8F3),
                                  child: Container(
                                    child: Text("Daftar"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:japis_new/sub-halaman/Ecommerce/FormBeli.dart';
// import 'package:japis_new/sub-halaman/Ecommerce/DetailBarang.dart';

// class ECommerce extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('E-Commerce')),
//         body: ListView(children: [
//           Card(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Pakaian Dinas Harian'),
//                   subtitle: Text('Detail: lihat deskripsi'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     TextButton(
//                       child: const Text('Deskripsi'),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DetailBarang()));
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                     TextButton(
//                       child: const Text('Beli'),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => FormBeli()));
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Card(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Pakaian Dinas Lapangan'),
//                   subtitle: Text('Detail: lihat deskripsi'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     TextButton(
//                       child: const Text('Deskripsi'),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DetailBarang()));
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                     TextButton(
//                       child: const Text('Beli'),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => FormBeli()));
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ]));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:japis_new/sub-halaman/Ehealthcare/FormDaftarHealthcare.dart';

// class EHealthcare extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('E-Healthcare')),
//         body: ListView(
//           children: [
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text('Pemeriksaan Kesehatan'),
//                     subtitle: Text('Tarif: 70.000/orang'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // TextButton(
//                       //   child: const Text('Detail'),
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) => DetailSewa()));
//                       //   },
//                       // ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FormDaftarHealthcare()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text('Medical Check Lisensi Diklat'),
//                     subtitle: Text('Tarif: 1.728.000/orang'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // TextButton(
//                       //   child: const Text('Detail'),
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) => DetailSewa()));
//                       //   },
//                       // ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FormDaftarHealthcare()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text('Pengobatan Malaria'),
//                     subtitle: Text('Tarif: 200.000/orang'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // TextButton(
//                       //   child: const Text('Detail'),
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) => DetailSewa()));
//                       //   },
//                       // ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FormDaftarHealthcare()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text('Pemeriksaan THT dan Mata'),
//                     subtitle: Text('Tarif: 125.000/orang'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // TextButton(
//                       //   child: const Text('Detail'),
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) => DetailSewa()));
//                       //   },
//                       // ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FormDaftarHealthcare()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text('Tes Narkoba'),
//                     subtitle: Text('Tarif: 350.000/orang'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       // TextButton(
//                       //   child: const Text('Detail'),
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //             builder: (context) => DetailSewa()));
//                       //   },
//                       // ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FormDaftarHealthcare()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailBAS.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailHFANP.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailJAS.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailMarshalling.dart';
// import 'package:japis_new/sub-halaman/Etraining/DetailSeMS.dart';
// import 'package:japis_new/sub-halaman/Etraining/FormDaftarPelatihan.dart';

// class Etraining extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('E-Training')),
//         body: ListView(
//           children: [
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.security),
//                     title: Text('Safety Management System'),
//                     // subtitle: Text('Sewa: per jam'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       TextButton(
//                         child: const Text('Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailSeMS()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FormDaftarPelatihan()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.security),
//                     title: Text('Marshalling'),
//                     // subtitle: Text('Sewa: per jam'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       TextButton(
//                         child: const Text('Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailMarshalling()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FormDaftarPelatihan()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.security),
//                     title: Text('Human Factor for Air Navigation Personnel'),
//                     // subtitle: Text('Sewa: per jam'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       TextButton(
//                         child: const Text('Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailHFANP()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FormDaftarPelatihan()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.security),
//                     title: Text('Basic Aviation Security'),
//                     // subtitle: Text('Sewa: per jam'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       TextButton(
//                         child: const Text('Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailBAS()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FormDaftarPelatihan()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.security),
//                     title: Text('Junior Aviation Security'),
//                     // subtitle: Text('Sewa: per jam'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       TextButton(
//                         child: const Text('Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailJAS()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         child: const Text('Daftar'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FormDaftarPelatihan()));
//                         },
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

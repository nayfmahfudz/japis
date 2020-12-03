import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:japis_new/navigasi/pesanan/PesananQR.dart';
import 'package:http/http.dart' as http;

class Pesanan extends StatelessWidget {
  Future data() async {
    print(user.token);
    final url = "http://ptb.namaindah.com/api/mybooking";
    final response = await http
        .post(url, body: {'id_member': user.id_member, 'token': user.token});
    print(user.token);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Pesanan';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color(0xFF44D8F3),
        ),
        body: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator())));
            } else {
              List listdata = snapshot.data["data"];
              print(snapshot.data);
              return ListView.builder(
                itemCount: listdata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                    height: 100,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PesananQR()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "gambar/qr.jpeg",
                                height: 50,
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ID Pesanan: " +
                                        listdata[index]["no_invoice"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Tanggal Pesanan: " +
                                      listdata[index]["booking_date"]),
                                  Text("Status Pesanan: " +
                                      listdata[index]["status_bayar"]),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {},
                                textColor: Colors.white,
                                color: Color(0xFF44D8F3),
                                child: Container(
                                  child: Text(listdata[index]["status_bayar"]),
                                ),
                              )
                            ],
                          )),
                    )),
              );
            }
          },
        )
        // ListView(
        //   children: <Widget>[
        //     Padding(
        //       padding: EdgeInsets.all(10),
        //     ),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10.0),
        //           ),
        //           child: InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => PesananQR()));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   Image.asset(
        //                     "gambar/qr.jpeg",
        //                     height: 50,
        //                     width: 50,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "ID Pesanan: 1qa2s3d4f5g",
        //                         style: TextStyle(fontWeight: FontWeight.bold),
        //                       ),
        //                       Text("Tanggal Pesanan: 12/09/2020 "),
        //                       Text("Status Pesanan: Sudah Dibayar"),
        //                     ],
        //                   ),
        //                   RaisedButton(
        //                     onPressed: () {},
        //                     textColor: Colors.white,
        //                     color: Color(0xFF44D8F3),
        //                     child: Container(
        //                       child: Text("Refund"),
        //                     ),
        //                   )
        //                 ],
        //               )),
        //         )),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           child: InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => PesananQR()));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   Image.asset(
        //                     "gambar/qr.jpeg",
        //                     height: 50,
        //                     width: 50,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "ID Pesanan: 34f5g6hj8k",
        //                         style: TextStyle(fontWeight: FontWeight.bold),
        //                       ),
        //                       Text("Tanggal Pesanan: 12/09/2020 "),
        //                       Text("Status Pesanan: Belum Dibayar"),
        //                     ],
        //                   ),
        //                   RaisedButton(
        //                     onPressed: () {},
        //                     textColor: Colors.white,
        //                     color: Color(0xFF44D8F3),
        //                     child: Container(
        //                       child: Text("Bayar"),
        //                     ),
        //                   )
        //                 ],
        //               )),
        //         )),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           child: InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => PesananQR()));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   Image.asset(
        //                     "gambar/qr.jpeg",
        //                     height: 50,
        //                     width: 50,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "ID Pesanan: 5g2dj7jfs2",
        //                         style: TextStyle(fontWeight: FontWeight.bold),
        //                       ),
        //                       Text("Tanggal Pesanan: 12/09/2020 "),
        //                       Text("Status Pesanan: Diterima"),
        //                     ],
        //                   ),
        //                   RaisedButton(
        //                     onPressed: () {},
        //                     textColor: Colors.white,
        //                     color: Color(0xFF44D8F3),
        //                     child: Container(
        //                       child: Text("Beri Ulasan"),
        //                     ),
        //                   )
        //                 ],
        //               )),
        //         )),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           child: InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => PesananQR()));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   Image.asset(
        //                     "gambar/qr.jpeg",
        //                     height: 50,
        //                     width: 50,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "ID Pesanan: 1af4h6k8d3",
        //                         style: TextStyle(fontWeight: FontWeight.bold),
        //                       ),
        //                       Text("Tanggal Pesanan: 12/09/2020 "),
        //                       Text("Status Pesanan: Belum Dibayar"),
        //                     ],
        //                   ),
        //                   RaisedButton(
        //                     onPressed: () {},
        //                     textColor: Colors.white,
        //                     color: Color(0xFF44D8F3),
        //                     child: Container(
        //                       child: Text("Bayar"),
        //                     ),
        //                   )
        //                 ],
        //               )),
        //         )),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           child: InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => PesananQR()));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   Image.asset(
        //                     "gambar/qr.jpeg",
        //                     height: 50,
        //                     width: 50,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "ID Pesanan: b5c3v4m8v4",
        //                         style: TextStyle(fontWeight: FontWeight.bold),
        //                       ),
        //                       Text("Tanggal Pesanan: 12/09/2020 "),
        //                       Text("Status Pesanan: Selesai"),
        //                     ],
        //                   ),
        //                   RaisedButton(
        //                     onPressed: () {},
        //                     textColor: Colors.white,
        //                     color: Color(0xFF44D8F3),
        //                     child: Container(
        //                       child: Text("Bayar"),
        //                     ),
        //                   )
        //                 ],
        //               )),
        //         )),
        //     Container(
        //         height: 100,
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         child: Card(
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Image.asset(
        //                 "gambar/qr.jpeg",
        //                 height: 50,
        //                 width: 50,
        //               ),
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     "ID Pesanan: x2v34b57m8z1",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text("Tanggal Pesanan: 12/09/2020 "),
        //                   Text("Status Pesanan: Selesai"),
        //                 ],
        //               ),
        //               RaisedButton(
        //                 onPressed: () {},
        //                 textColor: Colors.white,
        //                 color: Color(0xFF44D8F3),
        //                 child: Container(
        //                   child: Text("Bayar"),
        //                 ),
        //               )
        //             ],
        //           ),
        //         )),
        //   ],
        // ),
        );
  }
}

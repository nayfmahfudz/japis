import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/total_bayar_pesanan.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:japis_new/navigasi/pesanan/PesananQR.dart';
import 'package:http/http.dart' as http;

class Pesanan extends StatelessWidget {
  Future data() async {
    print(user.token);
    print("dd");
    print(user.id_member);
    final url = "http://ptb.namaindah.com/api/mybooking";
    final response = await http
        .post(url, body: {'id_member': user.id_member, 'token': user.token});
    print(user.token);
    final jsondata = jsonDecode(response.body);
    print(jsondata);
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
        body: user == null
            ? Container(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text("Silahkan Login Data Anda Tidak Tersedia",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ),
              )
            : FutureBuilder(
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
                          // height: 100,
                          margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                                onTap: () {
                                  if (listdata[index]["status_bayar"] ==
                                      "lunas") {
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TotalBayar(listdata[index])));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Image.asset(
                                          "gambar/qr.jpeg",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "ID Pesanan: " +
                                                  listdata[index]["no_invoice"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                "Tanggal Pesanan: " +
                                                    listdata[index]
                                                        ["booking_date"],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text(
                                                "Status Pesanan: " +
                                                    listdata[index]
                                                        ["status_bayar"],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: RaisedButton(
                                          onPressed: () {},
                                          textColor: Colors.white,
                                          color: Color(0xFF44D8F3),
                                          child: Container(
                                            child: Text(listdata[index]
                                                ["status_bayar"]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    )
                                  ],
                                )),
                          )),
                    );
                  }
                },
              ));
  }
}

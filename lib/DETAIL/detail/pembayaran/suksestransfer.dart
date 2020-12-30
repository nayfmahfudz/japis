import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/berks.dart';
import 'package:japis_new/main.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:japis_new/navigasi/akun/Login.dart';

class Sukses extends StatefulWidget {
  Sukses();
  String judul;
  Map data;
  String imageurl;

  @override
  _SuksesState createState() => _SuksesState();
}

Future post(id, total) async {
  print(user.id_member);
  print(user.token);
  print(id);
  print(total);
  final url = "http://japis.poltekbangjayapura.ac.id/api/booking";
  final response = await http.post(url, body: {
    "id_member": user.id_member,
    "token": user.token,
    "id_layanan": id,
    "total_bayar": total,
  });

  final jsondata = jsonDecode(response.body);
  print(jsondata);

  return jsondata;
}

// POST http://japis.poltekbangjayapura.ac.id/api/booking

// ## form-data:
// id_member
// token
// id_layanan
// total_bayar
DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);

class _SuksesState extends State<Sukses> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    alarm(BuildContext context, String text) => showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                content: Text(
                  text ?? "Permintaan anda belum tersedia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                elevation: 3,
                actionsPadding: EdgeInsets.only(right: 28),
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      // okButton,
                      SizedBox(
                        width: 22,
                      ),
                    ],
                  )
                ],
              ),
            ));
    return Scaffold(
      body: Scaffold(
        bottomSheet: Container(
            // color: Colors.transparent,
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textColor: Colors.white,
              color: Color(0xFF44D8F3),
              child: Text('Kembali Ke Beranda'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyStatefulWidget()));
                // if (_formKey.currentState.validate()) {
                // post(widget.data["id_layanan"], widget.data["tarif"])
                //     .then((value) {
                //   // Map value;
                //   // print(value["status"]);
                //   if (value["status"] == true) {
                //     Navigator.pop(context);
                //     Navigator.pop(context);
                //     alarm(context, value["message"].toString());
                //   } else {
                //     alarm(context, value["message"].toString());
                //   }
                // });
                // }
              },
            )),
        appBar: AppBar(
          backgroundColor: Color(0xFF44D8F3),
          title: Text("Notifikasi Pembayaran"),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            child: ListView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Icon(
                  Icons.check,
                  size: 200,
                  color: Colors.green,
                ),
                Center(
                  child: Text("Terimakasih",
                      style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                        "Bukti Pembayaran ID pesanan telah kami terima.mohon menunggu konfirmasi selanjutnya",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

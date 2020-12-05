import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/berks.dart';
import 'package:japis_new/model/usermodel.dart';

class Bayar extends StatefulWidget {
  Bayar(this.data, this.imageurl, this.judul);
  String judul;
  Map data;
  String imageurl;

  @override
  _BayarState createState() => _BayarState();
}

Future post(id, total) async {
  print(user.id_member);
  print(user.token);
  print(id);
  print(total);
  final url = "http://ptb.namaindah.com/api/booking";
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

// POST http://ptb.namaindah.com/api/booking

// ## form-data:
// id_member
// token
// id_layanan
// total_bayar
DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);

class _BayarState extends State<Bayar> {
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
              child: Text('Lengapi Berkas'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Berkas(widget.judul, widget.data)));
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
          title: Text("Detail Pembayaran"),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            child: ListView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: ListView(
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(15),
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Image.network(
                                      widget.imageurl,
                                      fit: BoxFit.cover,
                                    )),
                                Expanded(
                                  child: Container(
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        Text(
                                          widget.data["nama_layanan"],
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "RP. " +
                                              widget.data["tarif"].toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF44D8F3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Text(
                                    "Ringkasan Pesanan"
                                    // data["nama_layanan"]
                                    ,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "jenis :" + widget.data["subjenis_layanan"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Tanggal :" + formattedDate.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Harga : RP. " +
                                        widget.data["tarif"].toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Total Pesanan : RP. " +
                                            widget.data["tarif"].toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Container(
                    child: Card(
                        child: ListView(
                            physics: ScrollPhysics(),
                            padding: EdgeInsets.all(20),
                            shrinkWrap: true,
                            children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                          child: Text(
                            "Silahkan Isi Untuk Melanjutkan Pesanan",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "Nama",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Alamat email tidak boleh kosong';
                            }
                            return null;
                          },
                          // controller: nameController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nama',
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                          // controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "Alamat",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Alamat  tidak boleh kosong';
                            }
                            return null;
                          },
                          // controller: nameController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Alamat',
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Text(
                            "Nomor Telepon",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nomor Telepon tidak boleh kosong';
                            }
                            return null;
                          },
                          // controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Password',
                          ),
                        ),
                      )
                    ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

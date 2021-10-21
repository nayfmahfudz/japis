import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/akun/BuatPassword.dart';
import 'package:http/http.dart' as http;

class VerifikasiPendaftaran extends StatefulWidget {
  VerifikasiPendaftaran(this.email);
  String email;
  @override
  _State createState() => _State();
}

class _State extends State<VerifikasiPendaftaran> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future pass() async {
    print(nameController.text);
    print(widget.email);
    var url = Uri.http('http://ptb.namaindah.com', '/api/verif');
    final response = await http.post(url,
        body: {'email': widget.email, "kode_verif_email": nameController.text});
    print(response.body);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  final _formKey = GlobalKey<FormState>();

  @override
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
        backgroundColor: Color(0xFF44D8F3),
        body: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 70),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'gambar/japis-logo.jpg',
                          height: 120.00,
                          width: 160.00,
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Silakan periksa kode verifikasi pada email atau terdapat didalam inbox spam',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          "Masukan Kode Otp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Otp tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Kode Otp',
                        ),
                      ),
                    ),
                    Container(
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Verifikasi'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              pass().then((value) {
                                // if (value["status"] != null) {
                                if (value["status"] == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BuatPassword(
                                              value["data"]["id_member"]
                                                  .toString(),
                                              value["data"]["token"]
                                                  .toString())));
                                } else {
                                  alarm(context, value["message"].toString());
                                }
                                // }
                              });
                            }
                          },
                        )),
                  ],
                ),
              ),
            )));
    // Scaffold(
    //     backgroundColor: Color(0xFF44D8F3),
    //     body: Form(
    //         key: _formKey,
    //         child: Padding(
    //             padding: EdgeInsets.all(10),
    //             child: ListView(
    //               children: <Widget>[
    //                 Image.asset(
    //                   'gambar/japis-logo.jpg',
    //                   height: 150.00,
    //                   width: 200.00,
    //                 ),
    //                 Container(
    //                     alignment: Alignment.center,
    //                     padding: EdgeInsets.all(10),
    //                     child: Text(
    //                       'Silakan periksa kode verifikasi pada email yang digunakan untuk mendaftar',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                       ),
    //                     )),
    //                 Container(
    //                   padding: EdgeInsets.all(10),
    //                   child: TextFormField(
    //                     keyboardType: TextInputType.number,
    //                     controller: nameController,
    //                     decoration: InputDecoration(
    //                       filled: true,
    //                       fillColor: Colors.white,
    //                       border: OutlineInputBorder(),
    //                       labelText: 'Kode verifikasi',
    //                     ),
    //                     validator: (value) {
    //                       if (value.isEmpty) {
    //                         return 'Kode verifikasi tidak boleh kosong';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                     height: 60,
    //                     padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
    //                     child: RaisedButton(
    //                       textColor: Colors.white,
    //                       color: Colors.blue,
    //                       child: Text('Verifikasi'),
    //                       onPressed: () {
    //                         if (_formKey.currentState.validate()) {
    //                           // If the form is valid, display a Snackbar.
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => BuatPassword()));
    //                         }
    //                       },
    //                     )),
    //               ],
    //             ))));
  }
}

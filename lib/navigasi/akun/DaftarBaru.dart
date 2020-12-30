import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/akun/Login.dart';
import 'package:japis_new/navigasi/akun/Verifikasi.dart';
import 'package:http/http.dart' as http;

class DaftarBaru extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DaftarBaru> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future signup() async {
    final url = "http://japis.poltekbangjayapura.ac.id/api/signup";
    print(nameController.text);
    print(passwordController.text);
    final response = await http.post(url,
        body: {'email': nameController.text, 'no_wa': passwordController.text});
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
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          "Email",
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
                            return 'Alamat email tidak boleh kosong';
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
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: Text(
                          "Nomor Handphone",
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
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: passwordController,
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
                          child: Text('Masuk'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              signup().then((value) {
                                // if (value["status"] != null) {
                                if (value["status"] == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VerifikasiPendaftaran(
                                                  nameController.text)));
                                } else {
                                  alarm(context, value["message"].toString());
                                }
                                // }
                              });
                            }
                          },
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Sudah punya akun?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Akun()));
                                },
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                  ],
                ),
              ),
            )));
  }
}

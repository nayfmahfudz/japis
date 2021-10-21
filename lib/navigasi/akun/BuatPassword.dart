import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/main.dart';
import 'package:japis_new/navigasi/akun/Login.dart';
import 'package:http/http.dart' as http;

class BuatPassword extends StatefulWidget {
  BuatPassword(this.id, this.token);
  String id;
  String token;
  @override
  _State createState() => _State();
}

class _State extends State<BuatPassword> {
//   berhasil(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             // title: Text('Pendaftaran Berhasil',
//             //     style: TextStyle(color: Colors.orange)),
//             content: Text(
//               Provider.of<Restapi>(context).getmsg(),
// //              textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.orange),
//             ),
//             elevation: 3,
// //                actionsPadding: EdgeInsets.only(right: 28),
//             actions: <Widget>[okButtontoLogin],
// //            actions: <Widget>[
// //              RaisedButton(
// //                  child: Text(
// //                    'OK',
// //                    style: TextStyle(color: Colors.orange),
// //                  ),
// //                  onPressed: (){
// //                    Navigator.pushNamed(context, "/Login");
// //                  }
// //              )
// //            ],
//           ));
// }
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future pass() async {
    var url = Uri.http('http://ptb.namaindah.com', '/api/setpass');
    print(nameController.text);
    print(passwordController.text);
    final response = await http.post(url, body: {
      'id': widget.id,
      'token': widget.id,
      "password": passwordController.text,
    });
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
                          "Buat Password",
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
                        // controller: nameController,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Buat Password',
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: Text(
                          "Ulangi Password",
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
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: 'Ulangi Password',
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
                          child: Text('Simpan'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              pass().then((value) {
                                // if (value["status"] != null) {
                                if (value["status"] == true) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Akun()));
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
  }
}

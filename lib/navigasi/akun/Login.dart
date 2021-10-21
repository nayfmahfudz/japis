import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/main.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:japis_new/navigasi/akun/DaftarBaru.dart';
import 'package:japis_new/navigasi/akun/Profil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Akun extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Akun> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future datamember(idmember, token) async {
    print(idmember);
    print(token);
    var url = Uri.http(
        'http://ptb.namaindah.com', '/api/member/id/$idmember?token=$token');
    print(url);
    final response = await http.get(url);

    final jsondata = jsonDecode(response.body);
    String data;
    user = User.fromJson(jsondata);
    data = json.encode(user.toJson());
    print(data);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("akun", data);
    print(user);

    return jsondata;
  }

  Future login() async {
    var url = Uri.http('http://ptb.namaindah.com', '/api/login');
    final response = await http.post(url, body: {
      'email': nameController.text,
      'password': passwordController.text
    });
    final jsondata = jsonDecode(response.body);
    print(jsondata);

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

    if (user != null) {
      return HalamanProfil();
    } else {
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
                            "Password",
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
                                login().then((value) {
                                  // Map value;
                                  // print(value["status"]);
                                  if (value["status"] == true) {
                                    datamember(
                                        value["data"]["id_member"].toString(),
                                        value["data"]["token"].toString());
                                    // user = User.fromJson(value["data"]);
                                    // user.token =
                                    //     value["data"]["token"].toString();
                                    // user.id_member =
                                    //     value["data"]["id_member"].toString();
                                    // print(user.token);
                                    // print(user.id_member);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyStatefulWidget()));
                                  } else {
                                    alarm(context, value["message"].toString());
                                  }
                                });
                                // If the form is valid, display a Snackbar.
                                //
                              }
                            },
                          )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            'Belum punya akun?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Daftar Baru',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DaftarBaru()));
                            },
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
}

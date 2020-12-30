import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/akun/Login.dart';
import 'package:japis_new/navigasi/akun/Verifikasi.dart';
import 'package:http/http.dart' as http;

class Hubungi extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Hubungi> {
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
        body: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF44D8F3),
              title: Text("Hubungi Kami"),
            ),
            body: Center(
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xFF44D8F3),
                    size: 50,
                  ),
                  Text("Telepon"),
                  Text("(0967) 541049"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Icon(
                    Icons.mail,
                    color: Color(0xFF44D8F3),
                    size: 50,
                  ),
                  Text("Email"),
                  Text("poltekbang.jayapura@dephub.go.id"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Icon(
                    Icons.fact_check,
                    color: Color(0xFF44D8F3),
                    size: 50,
                  ),
                  Text("Faxmile"),
                  Text("(0967) 541562"),
                ],
              )),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:japis_new/main.dart';
import 'package:japis_new/navigasi/akun/Login.dart';
import 'package:http/http.dart' as http;

class BuatPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BuatPassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future pass() async {
    final url = "http://ptb.namaindah.com/api/setpass";
    final response = await http.post(url, body: {
      'id': nameController.text,
      'token': passwordController.text,
      "password": ""
    });
    print(response.body);
    return response.body;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        // controller: passwordController,
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Akun()));
                            }
                          },
                        )),
                  ],
                ),
              ),
            )));
  }
}

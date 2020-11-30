import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/akun/BuatPassword.dart';

void main() {
  runApp(MaterialApp(
    home: VerifikasiPendaftaran(),
  ));
}

class VerifikasiPendaftaran extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<VerifikasiPendaftaran> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF44D8F3),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Image.asset(
                      'gambar/japis-logo.jpg',
                      height: 150.00,
                      width: 200.00,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Silakan periksa kode verifikasi pada email yang digunakan untuk mendaftar',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Kode verifikasi',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Kode verifikasi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Verifikasi'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BuatPassword()));
                            }
                          },
                        )),
                  ],
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:japis_new/main.dart';

void main() {
  runApp(MaterialApp(
    home: BuatPassword(),
  ));
}

class BuatPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BuatPassword> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
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
                    Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'gambar/japis-logo.jpg',
                          height: 150.00,
                          width: 200.00,
                        )),
                    // Container(
                    //     padding: EdgeInsets.all(10),
                    //     child: Text(
                    //       'Buat Password',
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white),
                    //     )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Kolom password tidak boleh kosong';
                          }
                          return null;
                        },
                        // controller: nameController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Buat password baru',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password tidak sama. Silakan periksa kembali.';
                          }
                          return null;
                        },
                        // controller: nameController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Ulangi password',
                        ),
                      ),
                    ),
                    Container(
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Simpan'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            }
                          },
                        )),
                  ],
                ))));
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class FormDaftarPelatihan extends StatefulWidget {
  @override
  _FormDaftarPelatihanState createState() => _FormDaftarPelatihanState();
}

enum SingingCharacter { lafayette, jefferson }

class _FormDaftarPelatihanState extends State<FormDaftarPelatihan> {
  // String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformVersion = await FlutterOpenWhatsapp.platformVersion;
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }
    // if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  bool valuefirst = false;
  bool valuesecond = false;
  // SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Daftar Pelatihan'),
          ),
          body: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: ' Nama',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: ' Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: ' No.HP',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Alamat pendaftar',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'Apakah pelatihan yang diikuti dan data yang dimasukkan sudah benar? ',
              style: TextStyle(fontSize: 17.0),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: this.valuefirst,
              onChanged: (bool value) {
                setState(() {
                  this.valuefirst = value;
                });
              },
            ),
            Center(
                child: RaisedButton(
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "6281287878596",
                    // "628996823786",
                    "Halo admin, "
                        "ada permintaan \"daftar pelatihan\" (namapelatihan), "
                        "dari (nama), (email), (nohp), (alamat), "
                        "segera follow up melalui whatsapp");
              },
              // Text('Kirim pesan: $_platformVersion\n'),
              child: Text('Kirim pesan'),
            )),
          ])),
    );
  }
}

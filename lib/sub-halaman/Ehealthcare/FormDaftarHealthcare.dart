import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class FormDaftarHealthcare extends StatefulWidget {
  @override
  _FormDaftarHealthcareState createState() => _FormDaftarHealthcareState();
}

class _FormDaftarHealthcareState extends State<FormDaftarHealthcare> {
  // String _platformVersion = 'Unknown';
  String dropdownValue = '09.00-10.00';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Form Layanan Kesehatan'),
          ),
          body: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama',
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
                hintText: 'email',
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
                hintText: 'no.hp',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                '09.00-10.00',
                '10.00-11.00',
                '11.00-12.00',
                '13.00-14.00',
                '14.00-15.00'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Center(
                child: RaisedButton(
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "6281287878596",
                    // "628996823786",
                    "Halo admin, "
                        "ada permintaan \"pelayanan kesehatan\" (namalayanan), "
                        "dari (nama), (email), (nohp), (waktudaftar), "
                        "segera follow up melalui whatsapp");
              },
              // Text('Kirim pesan: $_platformVersion\n'),
              child: Text('Kirim pesan'),
            )),
          ])),
    );
  }
}

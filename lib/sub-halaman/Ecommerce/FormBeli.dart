import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class FormBeli extends StatefulWidget {
  @override
  _FormBeliState createState() => _FormBeliState();
}

class _FormBeliState extends State<FormBeli> {
  // String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      // platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Form Pembelian'),
          ),
          body: Column(children: [
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
                hintText: ' No.hp',
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
                hintText: ' Jumlah pembelian',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Center(
                child: RaisedButton(
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "6281287878596",
                    "Halo admin, "
                        "ada \"pesanan pembelian\" (namabarang), "
                        "dari (nama), (email), (nohp), (jumlahpembelian), "
                        "segera follow up melalui whatsapp");
              },
              // Text('Kirim pesan: $_platformVersion\n'),
              child: Text('Beli'),
            )),
          ])),
    );
  }
}

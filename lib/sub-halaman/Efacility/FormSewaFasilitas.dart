import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class FormSewa extends StatefulWidget {
  @override
  _FormSewaState createState() => _FormSewaState();
}

class _FormSewaState extends State<FormSewa> {
  String namapemesan;
  // final controllerNama = TextEditingController();
  // final controllerEmail = TextEditingController();
  // final controllerNope = TextEditingController();
  // final controllerWaktuSewa = TextEditingController();

  var teksRandom = 'Entah apa ini';
  var pesanWatsap = Text('pesan untuk WA');

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   controllerNama.dispose();
  //   controllerEmail.dispose();
  //   controllerNope.dispose();
  //   controllerWaktuSewa.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Form Sewa Fasilitas'),
          ),
          body: Column(children: [
            TextFormField(
              // controller: controllerNama,
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
              // controller: controllerEmail,
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
              // controller: controllerNope,
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
            TextFormField(
              // controller: controllerWaktuSewa,
              decoration: const InputDecoration(
                hintText: 'waktu sewa',
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
                    // "628996823786",
                    "Halo admin, "
                        "ada permintaan \"sewa fasilitas\" (namafasilitas), "
                        "dari (nama), (email), (no.hp), (waktusewa), "
                        "segera follow up melalui whatsapp");
              },
              child: Text('Kirim pesan'),
            )),
          ])),
    );
  }
}

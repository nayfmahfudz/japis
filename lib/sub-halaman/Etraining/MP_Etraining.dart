import 'package:flutter/material.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailBAS.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailHFANP.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailJAS.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailMarshalling.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailSeMS.dart';
import 'package:japis_new/sub-halaman/Etraining/FormDaftarPelatihan.dart';

class Etraining extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('E-Training')),
        body: ListView(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Safety Management System'),
                    // subtitle: Text('Sewa: per jam'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSeMS()));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDaftarPelatihan()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Marshalling'),
                    // subtitle: Text('Sewa: per jam'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailMarshalling()));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDaftarPelatihan()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Human Factor for Air Navigation Personnel'),
                    // subtitle: Text('Sewa: per jam'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailHFANP()));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDaftarPelatihan()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Basic Aviation Security'),
                    // subtitle: Text('Sewa: per jam'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailBAS()));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDaftarPelatihan()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Junior Aviation Security'),
                    // subtitle: Text('Sewa: per jam'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailJAS()));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDaftarPelatihan()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

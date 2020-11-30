import 'package:flutter/material.dart';
import 'package:japis_new/sub-halaman/Ehealthcare/FormDaftarHealthcare.dart';

class EHealthcare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('E-Healthcare')),
        body: ListView(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.local_hospital),
                    title: Text('Pemeriksaan Kesehatan'),
                    subtitle: Text('Tarif: 70.000/orang'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // TextButton(
                      //   child: const Text('Detail'),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => DetailSewa()));
                      //   },
                      // ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormDaftarHealthcare()));
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
                    leading: Icon(Icons.local_hospital),
                    title: Text('Medical Check Lisensi Diklat'),
                    subtitle: Text('Tarif: 1.728.000/orang'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // TextButton(
                      //   child: const Text('Detail'),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => DetailSewa()));
                      //   },
                      // ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormDaftarHealthcare()));
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
                    leading: Icon(Icons.local_hospital),
                    title: Text('Pengobatan Malaria'),
                    subtitle: Text('Tarif: 200.000/orang'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // TextButton(
                      //   child: const Text('Detail'),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => DetailSewa()));
                      //   },
                      // ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormDaftarHealthcare()));
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
                    leading: Icon(Icons.local_hospital),
                    title: Text('Pemeriksaan THT dan Mata'),
                    subtitle: Text('Tarif: 125.000/orang'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // TextButton(
                      //   child: const Text('Detail'),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => DetailSewa()));
                      //   },
                      // ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormDaftarHealthcare()));
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
                    leading: Icon(Icons.local_hospital),
                    title: Text('Tes Narkoba'),
                    subtitle: Text('Tarif: 350.000/orang'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // TextButton(
                      //   child: const Text('Detail'),
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => DetailSewa()));
                      //   },
                      // ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Daftar'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormDaftarHealthcare()));
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

import 'package:flutter/material.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailBravo.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailElelim.dart';
import 'package:japis_new/sub-halaman/Efacility/FormSewaFasilitas.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailBasket.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailFutsal.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailSerbaguna.dart';

class ModelMenu extends StatelessWidget {
  ModelMenu();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Efacility()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset('gambar/mp-efacility-100px.png'),
                color: Color(0xFF44D8F3),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 17, top: 15, bottom: 15),
                child: Text(
                  "Kategori",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Card(
                        color: Color(0xFF44D8F3),
                        child: Text("sss"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Card(
                        color: Color(0xFF44D8F3),
                        child: Text("sss"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Card(
                        color: Color(0xFF44D8F3),
                        child: Text("sss"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.sports_soccer),
                          title: Text('Lapangan Futsal'),
                          subtitle: Text('Sewa: per jam'),
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
                                        builder: (context) => DetailFutsal()));
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Sewa'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormSewa()));
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
                          leading: Icon(Icons.sports_basketball),
                          title: Text('Lapangan Basket'),
                          subtitle: Text('Sewa: per jam'),
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
                                        builder: (context) => DetailBasket()));
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Sewa'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormSewa()));
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
                          leading: Icon(Icons.business),
                          title: Text('Gedung Serbaguna'),
                          subtitle: Text('Sewa: per 4 jam'),
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
                                        builder: (context) =>
                                            DetailSerbaguna()));
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Sewa'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormSewa()));
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
                          leading: Icon(Icons.business),
                          title: Text('Asrama Elelim'),
                          subtitle: Text('Sewa: orang per kamar per hari'),
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
                                        builder: (context) => DetailElelim()));
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Sewa'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormSewa()));
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
                          leading: Icon(Icons.business),
                          title: Text('Asrama Bravo'),
                          subtitle: Text('Sewa: orang per kamar per hari'),
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
                                        builder: (context) => DetailBravo()));
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Sewa'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormSewa()));
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

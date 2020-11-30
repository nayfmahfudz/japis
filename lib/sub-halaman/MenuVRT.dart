import 'package:flutter/material.dart';

class MenuVRT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('VRT')),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              child: InkWell(
                  onTap: () {},
                  child: Image.asset('gambar/vrt-kampen_100px.png')),
              color: Colors.teal[200],
            ),
            Card(
              child: Image.asset('gambar/vrt-dbu_100px.png'),
              color: Colors.teal[200],
            ),
            Card(
              child: Image.asset('gambar/vrt-dnp_100px.png'),
              color: Colors.teal[200],
            ),
            Card(
              child: Image.asset('gambar/vrt-ditangud_100px.png'),
              color: Colors.teal[200],
            ),
            Card(
              child: Image.asset('gambar/vrt-dkppu_100px.png'),
              color: Colors.teal[200],
            ),
          ],
        ));
  }
}

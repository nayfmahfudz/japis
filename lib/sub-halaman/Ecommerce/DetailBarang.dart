import 'package:flutter/material.dart';

class DetailBarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(children: [
        Padding(padding: EdgeInsets.all(50)),
        Text(
          'Nama Barang: \n',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Pakaian Dinas Harian \n'),
        Text(
          'Stok: \n',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Kosong \n'),
        Text(
          'Harga: \n',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Pre order'),
      ]))),
    );
  }
}

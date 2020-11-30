import 'package:flutter/material.dart';
import 'package:japis_new/sub-halaman/Ecommerce/FormBeli.dart';
import 'package:japis_new/sub-halaman/Ecommerce/DetailBarang.dart';

class ECommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('E-Commerce')),
        body: ListView(children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text('Pakaian Dinas Harian'),
                  subtitle: Text('Detail: lihat deskripsi'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Deskripsi'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBarang()));
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Beli'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormBeli()));
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
                  leading: Icon(Icons.shopping_bag),
                  title: Text('Pakaian Dinas Lapangan'),
                  subtitle: Text('Detail: lihat deskripsi'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Deskripsi'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBarang()));
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Beli'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormBeli()));
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}

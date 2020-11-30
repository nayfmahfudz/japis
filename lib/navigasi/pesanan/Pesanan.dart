import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/pesanan/PesananQR.dart';

class Pesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Pesanan';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color(0xFF44D8F3),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananQR()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "gambar/qr.jpeg",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ID Pesanan: 1qa2s3d4f5g",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Tanggal Pesanan: 12/09/2020 "),
                              Text("Status Pesanan: Sudah Dibayar"),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Color(0xFF44D8F3),
                            child: Container(
                              child: Text("Refund"),
                            ),
                          )
                        ],
                      )),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananQR()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "gambar/qr.jpeg",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ID Pesanan: 34f5g6hj8k",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Tanggal Pesanan: 12/09/2020 "),
                              Text("Status Pesanan: Belum Dibayar"),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Color(0xFF44D8F3),
                            child: Container(
                              child: Text("Bayar"),
                            ),
                          )
                        ],
                      )),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananQR()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "gambar/qr.jpeg",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ID Pesanan: 5g2dj7jfs2",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Tanggal Pesanan: 12/09/2020 "),
                              Text("Status Pesanan: Diterima"),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Color(0xFF44D8F3),
                            child: Container(
                              child: Text("Beri Ulasan"),
                            ),
                          )
                        ],
                      )),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananQR()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "gambar/qr.jpeg",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ID Pesanan: 1af4h6k8d3",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Tanggal Pesanan: 12/09/2020 "),
                              Text("Status Pesanan: Belum Dibayar"),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Color(0xFF44D8F3),
                            child: Container(
                              child: Text("Bayar"),
                            ),
                          )
                        ],
                      )),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananQR()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "gambar/qr.jpeg",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "ID Pesanan: b5c3v4m8v4",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Tanggal Pesanan: 12/09/2020 "),
                              Text("Status Pesanan: Selesai"),
                            ],
                          ),
                        ],
                      )),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "gambar/qr.jpeg",
                        height: 50,
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "ID Pesanan: x2v34b57m8z1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Tanggal Pesanan: 12/09/2020 "),
                          Text("Status Pesanan: Selesai"),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

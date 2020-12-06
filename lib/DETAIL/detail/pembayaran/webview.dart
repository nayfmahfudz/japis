// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/suksestransfer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBayar extends StatefulWidget {
  WebViewBayar(this.data, this.databank);
  Map data, databank;
  String tanggal;
  @override
  _WebViewBayarState createState() => _WebViewBayarState();
}

class _WebViewBayarState extends State<WebViewBayar> {
  List listbank = [
    {"nama": "Bank BNI", "cabang": "JayaPura", "rekening": "98989686787"},
    {"nama": "Bank BRI", "cabang": "JayaPura", "rekening": "868546456"},
    {"nama": "Bank Mandiri", "cabang": "JayaPura", "rekening": "22759907"}
  ];
  int index = 0;
  int indexbutton = 1;
  setSelectedRadio(int val) {
    setState(() {
      indexbutton = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
        appBar: AppBar(
          title: Text("Pembayaran"),
          backgroundColor: Color(0xFF44D8F3),
        ),
        bottomNavigationBar: Container(
          height: 50,
          // width: 100,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    color: Color(0xFF44D8F3),
                    child: Center(
                        child: Text(
                      "RP. " + widget.data["total_bayar"],
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Sukses()));
                },
                child: Container(
                    height: 50,
                    width: 80,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "Bayar",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Builder(
                builder: (contex) => WebView(
                      initialUrl:
                          'http://ptb.namaindah.com/qrcode/${widget.data["no_invoice"]}',
                    )),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  children: [Text(widget.databank["waktu"])],
                ),
              ),
            )
          ],
        ));
  }
}

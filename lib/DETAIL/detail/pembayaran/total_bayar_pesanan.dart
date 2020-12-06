// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/webview.dart';

class TotalBayar extends StatefulWidget {
  TotalBayar(this.data);
  Map data;
  @override
  _TotalBayarState createState() => _TotalBayarState();
}

class _TotalBayarState extends State<TotalBayar> {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WebViewBayar(widget.data, listbank[index])));
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
      body: ListView(
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(10),
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 35, 25, 10),
                      child: Text("Total Bayar",
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Text("Rp. " + widget.data["total_bayar"],
                          style: TextStyle(
                            color: Color(0xFF44D8F3),
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: Text(
                          "Silahkan melakukan pembayaran melalui transfer ke",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 3),
                      child: Text(listbank[index]["nama"],
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 5),
                      child: Text(listbank[index]["cabang"],
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Text("Rekening",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(listbank[index]["rekening"],
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                              )),
                          InkWell(
                              onTap: () {
                                // ClipboardManager.copyToClipBoard(
                                //         listbank[index]["rekening"])
                                //     .then((result) {
                                //   final snackBar = SnackBar(
                                //     content: Padding(
                                //       padding:
                                //           const EdgeInsets.only(bottom: 200),
                                //       child: Text('Copied to Clipboard'),
                                //     ),
                                //     action: SnackBarAction(
                                //       label: 'Undo',
                                //       onPressed: () {},
                                //     ),
                                //   );
                                //   Scaffold.of(context).showSnackBar(snackBar);
                                // });
                              },
                              child: Icon(Icons.copy))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Text(
                          "Gunakan tombol 'Copy' untuk meng-copy nomor rekening kemudian klik tombol 'Bayar' dibawah untuk melanjutkan proses",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Text("Silahkan Pilih Metode Pembayaran",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 35),
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 30),
                        shrinkWrap: true,
                        itemCount: listbank.length,
                        itemBuilder: (BuildContext context, int i) {
                          return InkWell(
                            onTap: () {
                              print(widget.data);
                              index = i;
                              setSelectedRadio(i + 1);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Radio(
                                  value: i + 1,
                                  groupValue: indexbutton,
                                  onChanged: (value) {
                                    setState(() {
                                      index = i;
                                      setSelectedRadio(value);
                                      print(value);
                                    });
                                  },
                                ),
                                new Text(
                                  listbank[i]["nama"],
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

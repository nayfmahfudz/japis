import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japis_new/model/usermodel.dart';

class Berkas extends StatefulWidget {
  Berkas(this.judul, this.data);
  Map data;
  String judul;
  @override
  _BerkasState createState() => _BerkasState();
}

class _BerkasState extends State<Berkas> {
  Future post(id, total) async {
    print(user.id_member);
    print(user.token);
    print(id);
    print(total);
    final url = "http://ptb.namaindah.com/api/booking";
    final response = await http.post(url, body: {
      "id_member": user.id_member,
      "token": user.token,
      "id_layanan": id,
      "total_bayar": total,
    });

    final jsondata = jsonDecode(response.body);
    print(jsondata);

    return jsondata;
  }

  File dummy;

  File bukti, uangmuka;
  File ijazah;
  File keterangan;
  final picker = ImagePicker();
  Future getFile() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print("kesini1");
        dummy = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    return dummy;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        print("kesini1");
        dummy = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    return dummy;
  }

  @override
  void initState() {
    super.initState();
    dummy = null;
    bukti = null;
    uangmuka = null;
    ijazah = null;
    keterangan = null;
  }

  @override
  Widget build(BuildContext context) {
    alarm(BuildContext context, String text) => showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                content: Text(
                  text ?? "Permintaan anda belum tersedia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                elevation: 3,
                actionsPadding: EdgeInsets.only(right: 28),
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      // okButton,
                      SizedBox(
                        width: 22,
                      ),
                    ],
                  )
                ],
              ),
            ));
    topup(BuildContext context, String parameter) => showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                content: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              getImage().then((value) {
                                print(value);
                                print(parameter);
                                setState(() {
                                  if (parameter == "ijazah") {
                                    ijazah = value;
                                  } else if (parameter == "keterangan") {
                                    keterangan = value;
                                  } else if (parameter == "uangmuka") {
                                    uangmuka = value;
                                  } else {
                                    bukti = value;
                                  }
                                });
                              });
                            },
                            child: Center(
                              child: Container(
                                child: Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              getFile().then((value) {
                                if (parameter == "ijazah") {
                                  ijazah = value;
                                } else if (parameter == "keterangan") {
                                  keterangan = value;
                                } else {
                                  bukti = value;
                                }
                              });
                            },
                            child: Center(
                              child: Container(
                                child: Text(
                                  "Galerry",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 3,
                actionsPadding: EdgeInsets.only(right: 28),
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      // okButton,
                      SizedBox(
                        width: 22,
                      ),
                    ],
                  )
                ],
              ),
            ));
    return Scaffold(
      body: Scaffold(
          bottomSheet: Container(
              // color: Colors.transparent,
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                color: Color(0xFF44D8F3),
                child: Text('Lengapi Berkas'),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Berkas(widget.judul)));
                  // if (_formKey.currentState.validate()) {
                  post(widget.data["id_layanan"], widget.data["tarif"])
                      .then((value) {
                    // Map value;
                    // print(value["status"]);
                    if (value["status"] == true) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      alarm(context, value["message"].toString());
                    } else {
                      alarm(context, value["message"].toString());
                    }
                  });
                  // }
                },
              )),
          appBar: AppBar(
            backgroundColor: Color(0xFF44D8F3),
            title: Text("Upload Berkas"),
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  child: Column(
                // mainAxisAlignment: ,
                children: [
                  widget.judul != "training"
                      ? Container()
                      : Column(
                          // mainAxisAlignment: ,
                          children: [
                              Text(
                                "Upload Ijazah",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ijazah != null
                                  ? InkWell(
                                      onTap: () {
                                        topup(context, "ijazah");
                                      },
                                      child: Image.file(ijazah))
                                  : InkWell(
                                      onTap: () {
                                        topup(context, "ijazah");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: Container(
                                          height: 200,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            color: Colors.grey.withOpacity(0.4),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Icon(
                                                  Icons.image_search_outlined,
                                                  size: 100,
                                                ),
                                                Text(
                                                  "Upload Berkas",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Surat Keterangan",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              keterangan != null
                                  ? InkWell(
                                      onTap: () {
                                        topup(context, "keterangan");
                                      },
                                      child: Image.file(keterangan))
                                  : InkWell(
                                      onTap: () {
                                        topup(context, "keterangan");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: Container(
                                          height: 200,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            color: Colors.grey.withOpacity(0.4),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Icon(
                                                  Icons.image_search_outlined,
                                                  size: 100,
                                                ),
                                                Text(
                                                  "Upload Berkas",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ]),
                  widget.judul != "healthcare"
                      ? Container()
                      : Column(children: [
                          Text(
                            "Bukti Bayar Uang Muka",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          keterangan != null
                              ? InkWell(
                                  onTap: () {
                                    topup(context, "uangmuka");
                                  },
                                  child: Image.file(uangmuka))
                              : InkWell(
                                  onTap: () {
                                    topup(context, "uangmuka");
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.grey.withOpacity(0.4),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Icon(
                                              Icons.image_search_outlined,
                                              size: 100,
                                            ),
                                            Text(
                                              "Upload Berkas",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ]),
                  widget.judul == "training" || widget.judul == "healthcare"
                      ? Container()
                      : Column(
                          children: [
                            Text(
                              "Bukti Transaksi",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            bukti != null
                                ? InkWell(
                                    onTap: () {
                                      topup(context, "bukti");
                                    },
                                    child: Image.file(bukti))
                                : InkWell(
                                    onTap: () {
                                      topup(context, "bukti");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                          color: Colors.grey.withOpacity(0.4),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(
                                                Icons.image_search_outlined,
                                                size: 100,
                                              ),
                                              Text(
                                                "Upload Berkas",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                ],
              )),
            ),
          )),
    );
  }
}

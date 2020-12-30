import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/suksestransfer.dart';
import 'package:japis_new/model/usermodel.dart';

class BayarPesanan extends StatefulWidget {
  BayarPesanan(this.bank, this.data);
  Map data;
  Map bank;
  @override
  _BayarPesananState createState() => _BayarPesananState();
}

class _BayarPesananState extends State<BayarPesanan> {
  Future post(File file) async {
    Response response;
    Dio dio = new Dio();
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "id_member": widget.data["id_member"],
      "id_booking": widget.data["id_booking"],
      "userfile": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    response = await dio.post(
        "http://japis.poltekbangjayapura.ac.id/api/buktitf",
        data: formData);
    print(response);
    return response.data;
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Sukses()));
                  // if (_formKey.currentState.validate()) {
                  post(bukti).then((value) {
                    // Map value;
                    print(value["status"]);
                    if (value["status"] == true) {
                      alarm(context, value["message"].toString());
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Sukses()));
                      });
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
                  Column(
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
                    ],
                  )
                ],
              )),
            ),
          )),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:japis_new/model/usermodel.dart';

class Alamat extends StatefulWidget {
  Alamat(this.judul, this.data);
  String judul;
  Map data;
  @override
  _AlamatState createState() => _AlamatState();
}

class _AlamatState extends State<Alamat> {
  @override
  Future post(id, total) async {
    // print(user.id_member);
    // print(user.token);
    // print(id);
    // print(total);
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

  int selected;
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
    alamat(BuildContext context, String text) => showDialog(
        context: context,
        builder: (context) => Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      // color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                          // key: _formKey,
                          child: Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Center(
                          child: ListView(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    "Alamat",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                                child: TextFormField(
                                  maxLines: 6,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Alamat tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    // fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    hintText: 'Alamat',
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    "Kelurahan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: new Border.all(
                                        color: Colors.black,
                                      )),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: Colors.grey,
                                    ),
                                    child: DropdownButton(
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: Text("Kelurahan"),
                                      ),
                                      // value: ,
                                      items: [].map((value) {
                                        return DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          // _valGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    "Kecamatan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: new Border.all(
                                        color: Colors.black,
                                      )),
                                  child: DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Text("Kecamatan"),
                                    ),
                                    // value: ,
                                    items: [].map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        // _valGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    "Kota",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: new Border.all(
                                        color: Colors.black,
                                      )),
                                  child: DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Text("Kota"),
                                    ),
                                    // value: ,
                                    items: [].map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        // _valGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    "Provinsi",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: new Border.all(
                                        color: Colors.black,
                                      )),
                                  child: DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Text("Provinsi"),
                                    ),
                                    // value: ,
                                    items: [].map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        // _valGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                  height: 60,
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    textColor: Colors.white,
                                    color: Color(0xFF44D8F3),
                                    child: Text(text),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // if (_formKey.currentState.validate()) {
                                      //   signup().then((value) {
                                      //     // if (value["status"] != null) {
                                      //     if (value["status"] == true) {
                                      //       Navigator.push(
                                      //           context,
                                      //           MaterialPageRoute(
                                      //               builder: (context) =>
                                      //                   VerifikasiPendaftaran(
                                      //                       nameController.text)));
                                      //     } else {
                                      //       alarm(context, value["message"].toString());
                                      //     }
                                      // }
                                      // });
                                    },
                                  )),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              //     elevation: 3,
              //     actionsPadding: EdgeInsets.only(right: 28),
              //     actions: <Widget>[
              //       Row(
              //         children: <Widget>[
              //           // okButton,
              //           SizedBox(
              //             width: 22,
              //           ),
              //         ],
              //       )
              //     ],
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
                    child: Text("Pilih Alamat"),
                    onPressed: () {
                      // post(widget.data["id_layanan"], widget.data["tarif"])
                      //     .then((value) {
                      //   // Map value;
                      //   // print(value["status"]);
                      //   if (value["status"] == true) {
                      Navigator.pop(context);
                      //   Navigator.pop(context);
                      //   Navigator.pop(context);
                      //   alarm(context, value["message"].toString());
                      // } else {
                      //   alarm(context, value["message"].toString());
                      // }
                      // });
                    })),
            appBar: AppBar(
              backgroundColor: Color(0xFF44D8F3),
              actions: [
                InkWell(
                    onTap: () {
                      alamat(context, "Tambahkan Alamat");
                    },
                    child: Icon(Icons.add))
              ],
              title: Text("Pilih Alamat Lain",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            body: Container(
                child: ListView(
              children: [
                Container(
                  height: 40,
                  width: 100,
                  padding: EdgeInsets.fromLTRB(15, 6, 15, 0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Alamat email tidak boleh kosong';
                            }
                            return null;
                          },
                          // controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Catatan',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selected = index;
                                  });
                                },
                                child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    selected == index
                                                        ? Icon(
                                                            Icons.circle,
                                                            color: Color(
                                                                0xFF44D8F3),
                                                          )
                                                        : Icon(Icons.circle,
                                                            color: Colors.grey),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          "Alamat Utama",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    alamat(context,
                                                        "Simpan Perubahan");
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        color: Colors.grey,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Text(
                                                            "Ubah Alamat",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                  " Wiyung Gg Berkah Jayapura",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ))),
                )
              ],
            ))));
  }
}

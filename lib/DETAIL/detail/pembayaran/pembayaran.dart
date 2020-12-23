import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/alamat.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/berks.dart';
import 'package:japis_new/model/usermodel.dart';

class Bayar extends StatefulWidget {
  Bayar(this.data, this.imageurl, this.judul, this.tombol);
  String judul, tombol;
  Map data;
  String imageurl;

  @override
  _BayarState createState() => _BayarState();
}

int index = 1;
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

@override
DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);
// DateTime selectedDate = DateTime.now();
// DateTime initialData;
TextEditingController _tanggal = TextEditingController();

class _BayarState extends State<Bayar> {
  String text1, text2, text3, text4, text5, text6;
  void initState() {
    index = 1;
    if (widget.judul == "healthcare") {
      text1 = "Datang ke klinik";
      text2 = "Kunjungan ke rumah";
      text3 = "Nomor Antrian";
      text4 = "13";
      text5 = "Biaya Kunjungan";
      text6 = "Rp.300.000";
    } else if (widget.judul == "commerce") {
      text1 = "Ambil Produk di tempat";
      text2 = "Kirim Produk ke alamat";
      text3 = "Alamat Pengambilan Produk";
      text4 = "Koperasi Poltekbang jaya pura jalan tanjung ria utara no 1";
      text5 = "alamat";
      text6 = "wiyung jaya pura";
    } else {
      text1 = "";
      text2 = "";
    }
  }

  // TextEditingController _tanggal = TextEditingController(text: formattedDate);
  @override
  int index;
  int tombol = 1;
  int indexlist = 0;
  List listdurasi = [
    "8-10 am",
    "12-2 pm",
    "2-4 pm",
    "4-6 pm",
    "6-8 pm",
    "8-10 pm",
  ];
  bool yakin = false;
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    // index = 1;
    if (widget.judul == "training") {
      widget.tombol = "Lengkapi Berkas";
    }
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
    return Form(
      // key: ,
      child: Scaffold(
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
                child: Text(widget.tombol),
                onPressed: () {
                  if (widget.judul == "training") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Berkas(widget.judul, widget.data)));
                  } else {
                    print(widget.judul);

                    // if (_formKey.currentState.validate()) {
                    post(widget.data["id_layanan"], widget.data["tarif"])
                        .then((value) {
                      // Map value;
                      // print(value["status"]);
                      if (value["status"] == true) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        alarm(context, value["message"].toString());
                      } else {
                        alarm(context, value["message"].toString());
                      }
                    });
                    // }
                  }

                  //
                },
              )),
          appBar: AppBar(
            backgroundColor: Color(0xFF44D8F3),
            title: Text("Detail Pembayaran"),
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              child: ListView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: ListView(
                              padding: EdgeInsets.all(10),
                              shrinkWrap: true,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(15),
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Image.network(
                                          widget.imageurl,
                                          fit: BoxFit.cover,
                                        )),
                                    Expanded(
                                      child: Container(
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Text(
                                              widget.data["nama_layanan"],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "RP. " +
                                                  (int.parse(widget
                                                              .data["tarif"]) *
                                                          index)
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF44D8F3)),
                                            ),
                                            widget.judul != "commerce"
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Jumlah :",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                index += 1;
                                                                print(index);
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 18,
                                                            )),
                                                        Text(
                                                          index.toString(),
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (index !=
                                                                    1) {
                                                                  index -= 1;
                                                                }
                                                                print(index);
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 18,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                            widget.judul == "commerce"
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        "Tanggal :",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Container(
                                                        // height: 100,
                                                        width: 30,
                                                        child: DateTimePicker(
                                                          type:
                                                              DateTimePickerType
                                                                  .date,
                                                          dateMask:
                                                              'd MMM, yyyy',
                                                          controller: _tanggal,
                                                          // initialValue: _initialValue,
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2100),
                                                          icon:
                                                              Icon(Icons.event),
                                                          dateLabelText:
                                                              'Tanggal',
                                                          timeLabelText: "Jam",
                                                          // initialValue: "",

                                                          //use24HourFormat: false,
                                                          //locale: Locale('pt', 'BR'),
                                                          // selectableDayPredicate:
                                                          //     (date) {
                                                          //   if (date.weekday ==
                                                          //           6 ||
                                                          //       date.weekday ==
                                                          //           7) {
                                                          //     return false;
                                                          //   }
                                                          //   return true;
                                                          // },
                                                          // onChanged: (val) => setState(() => _valueChanged1 = val),
                                                          // validator: (val) {
                                                          //   setState(() => _valueToValidate1 = val);
                                                          //   return null;
                                                          // },
                                                          // onSaved: (val) => setState(() => _valueSaved1 = val),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            widget.judul != "commerce"
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        "Catatan :",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        width: 80,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 0, 5, 0),
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return 'Alamat email tidak boleh kosong';
                                                            }
                                                            return null;
                                                          },
                                                          // controller: nameController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            hintText: 'Catatan',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            widget.judul != "facility"
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        "Durasi :",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (listdurasi
                                                                          .length -
                                                                      1 !=
                                                                  indexlist)
                                                                indexlist += 1;
                                                              print(listdurasi
                                                                  .length);
                                                              print(indexlist);
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 18,
                                                          )),
                                                      Text(
                                                        listdurasi[indexlist]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (indexlist !=
                                                                  1) {
                                                                indexlist -= 1;
                                                              }
                                                              print(indexlist);
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: 18,
                                                          ))
                                                    ],
                                                  ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Text(
                                        "Ringkasan Pesanan"
                                        // data["nama_layanan"]
                                        ,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "jenis :" +
                                            widget.data["subjenis_layanan"],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Text(
                                      //   "Tanggal :" + formattedDate.toString(),
                                      //   style: TextStyle(
                                      //       fontSize: 15,
                                      //       fontStyle: FontStyle.normal,
                                      //       fontWeight: FontWeight.w500,
                                      //       color: Colors.black),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Text(
                                        "Harga : RP. " +
                                            widget.data["tarif"].toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        height: 100,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Total Pesanan : RP. " +
                                                widget.data["tarif"].toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  user == null
                      ? Container()
                      : Container(
                          height: MediaQuery.of(context).size.height / 5,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  user.image == null || user.image == ""
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.person,
                                              size: 65,
                                            ),
                                            radius: 50.0,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              user.image,
                                            ),
                                            radius: 50.0,
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Login Sebagai"),
                                        Text(user.nama),
                                        Text(user.email),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  Container(
                      child: Card(
                          child: ListView(
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.all(20),
                              shrinkWrap: true,
                              children: <Widget>[
                        //
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                child: Text(
                                  "Silahkan Isi Untuk Melanjutkan Pesanan",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  "Nama",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Alamat email tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  // controller: nameController,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Nama',
                                  ),
                                ),
                              ),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Email tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  "Alamat",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Alamat  tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  // controller: nameController,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Alamat',
                                  ),
                                ),
                              ),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Text(
                                  "Nomor Telepon",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                        user != null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Nomor Telepon tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                              ),

                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 120,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    setState(() {
                                      tombol = 1;
                                    });
                                  },
                                  child: Text(
                                    text1,
                                    style: TextStyle(
                                        color: tombol == 1
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  color: tombol == 1
                                      ? Color(0xFF44D8F3)
                                      : Colors.grey,
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 120,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    setState(() {
                                      tombol = 2;
                                    });
                                  },
                                  child: Text(
                                    text2,
                                    style: TextStyle(
                                        color: tombol == 2
                                            ? Colors.white
                                            : Color(0xFF44D8F3),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  color: tombol == 2
                                      ? Color(0xFF44D8F3)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        tombol == 2 && widget.judul == "commerce"
                            ? Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 110),
                                          child: Text(
                                            text5,
                                            style: TextStyle(
                                                fontSize:
                                                    widget.judul == "commerce"
                                                        ? 14
                                                        : 30,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Alamat(widget.judul,
                                                              widget.data)));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    color: Color(0xFF44D8F3),
                                                  ),
                                                  Text(
                                                    "Pilih Alamat lain",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF44D8F3)),
                                                  )
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    Text(
                                      text6,
                                      style: TextStyle(
                                          fontSize: widget.judul == "commerce"
                                              ? 14
                                              : 30,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )
                            : tombol == 1
                                ? Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text(
                                          text3,
                                          style: TextStyle(
                                              fontSize:
                                                  widget.judul == "commerce"
                                                      ? 14
                                                      : 30,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          text4,
                                          style: TextStyle(
                                              fontSize:
                                                  widget.judul == "commerce"
                                                      ? 14
                                                      : 30,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text(
                                          text5,
                                          style: TextStyle(
                                              fontSize:
                                                  widget.judul == "commerce"
                                                      ? 14
                                                      : 30,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          text6,
                                          style: TextStyle(
                                              fontSize:
                                                  widget.judul == "commerce"
                                                      ? 14
                                                      : 30,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                      ]))),
                  InkWell(
                    onTap: () {
                      setState(() {
                        yakin = !yakin;
                      });
                    },
                    child: Container(
                      height: 50,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              yakin
                                  ? Icon(Icons.check_box)
                                  : Icon(Icons.check_box_outline_blank),
                              Text("Apakah Anda Yakin Melanjutkan Pesanan")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

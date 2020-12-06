import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:japis_new/sub-halaman/Efacility/DetailBravo.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailElelim.dart';
import 'package:japis_new/sub-halaman/Efacility/FormSewaFasilitas.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailBasket.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailFutsal.dart';
import 'package:japis_new/sub-halaman/Efacility/DetailSerbaguna.dart';
import 'package:japis_new/sub-halaman/Etraining/DetailMarshalling.dart';

class Efacility extends StatelessWidget {
  @override
  String imageurl;
  Future _future;
  Future semua() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/facility";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    print(jsondata);
    imageurl = jsondata["assets_uri"].toString();
    return jsondata;
  }

  Future asrama() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  Future pertemuan() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  Future olahraga() async {
    final url = "http://ptb.namaindah.com/api/layanan/e/";
    final response = await http.get(url);
    final jsondata = jsonDecode(response.body);
    return jsondata;
  }

  @override
  void initState() {
    _future = semua();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('E-Facility')),
        body: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF44D8F3),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Efacility()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Image.asset('gambar/mp-efacility-100px.png'),
                  color: Color(0xFF44D8F3),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 23, top: 15, bottom: 5),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset("gambar/stadium.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Gedung Olahraga",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset("gambar/pertemuan.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Gedung Pertemuan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xFF44D8F3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset("gambar/asrama.png")),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Gedung Asrama",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: FutureBuilder(
                    future: semua(),
                    builder: (context, snapshot) {
                      List listdata = snapshot.data["data"];
                      return Expanded(
                        flex: 1,
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount:
                                listdata.length == 0 ? 1 : listdata.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: CardData(listdata[index], imageurl),
                              );
                            },
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class CardData extends StatelessWidget {
  CardData(this.data, this.imageurl);
  Map data;
  String imageurl;
  List<String> foto;
  @override
  Widget build(BuildContext context) {
    foto = data["foto_layanan"].toString().split(",");
    // print(data["foto_layanan"].toString().split(","));
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailEtraining(data, imageurl, foto, "facility")));
      },
      child: Container(
        // margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.network(
                      imageurl + foto[0].toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(data["nama_layanan"],
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Rp. " + data["tarif"] + " -/jam",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF44D8F3),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonTheme(
                                minWidth: 70,
                                height: 30,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  color: Color(0xFF44D8F3),
                                  child: Text("Detail"),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 70,
                                height: 30,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  color: Color(0xFF44D8F3),
                                  child: Container(
                                    child: Text("Sewa"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

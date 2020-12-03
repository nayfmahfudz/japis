import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/pembayaran.dart';

class DetailEtraining extends StatefulWidget {
  DetailEtraining(this.data, this.imageurl, this.foto);
  TabController controller;
  List foto;
  Map data;
  String imageurl;
  @override
  _DetailEtrainingState createState() => _DetailEtrainingState();
}

class _DetailEtrainingState extends State<DetailEtraining>
    with SingleTickerProviderStateMixin {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List listwidget = [
      Container(
          child: Column(
        children: [
          Html(data: widget.data["info_layanan"]),
        ],
      )),
      Container(
          child: Column(
        children: [
          Html(data: widget.data["info_layanan"]),
        ],
      )),
      Container(
          child: Column(
        children: [
          Html(data: widget.data["info_layanan"]),
        ],
      ))
    ];
    return Scaffold(
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
                    "RP. " + widget.data["tarif"].toString(),
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
                        builder: (context) => Bayar(
                            widget.data, widget.imageurl + widget.foto[0])));
              },
              child: Container(
                  height: 50,
                  width: 80,
                  color: Colors.red,
                  child: Center(
                      child: Text(
                    "Daftar",
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
      body: Stack(
        children: [
          Row(children: [
            Container(
              color: Color(0xFF44D8F3),
            )
          ]),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              children: [
                // Padding(padding: EdgeInsets.all(20)),
                Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.imageurl + widget.foto[0],
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: CircleAvatar(
                            minRadius: 35,
                            backgroundImage: NetworkImage(
                                widget.imageurl + widget.foto[0],
                                scale: 100),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(widget.data["nama_layanan"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                            height: 35,
                            width: 110,
                            color: index == 0 ? Colors.grey : Color(0xFF44D8F3),
                            child: Center(
                                child: Text("Deskripsi",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: index == 0
                                          ? Color(0xFF44D8F3)
                                          : Colors.white,
                                    )))),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                            height: 35,
                            width: 110,
                            color: index == 1 ? Colors.grey : Color(0xFF44D8F3),
                            child: Center(
                                child: Text("Syarat",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: index == 1
                                          ? Color(0xFF44D8F3)
                                          : Colors.white,
                                    )))),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          height: 35,
                          width: 110,
                          color: index == 2 ? Colors.grey : Color(0xFF44D8F3),
                          child: Center(
                              child: Text("Ulasan",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: index == 2
                                        ? Color(0xFF44D8F3)
                                        : Colors.white,
                                  ))),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: Card(
                        child: listwidget[index],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

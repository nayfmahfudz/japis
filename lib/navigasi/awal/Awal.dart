import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:japis_new/sub-halaman/MenuMarketplace.dart';
import 'package:japis_new/sub-halaman/MenuVRT.dart';

class HalamanAwal extends StatelessWidget {
  _launchURL() async {
    const url = 'https://e-office.poltekbangjayapura.ac.id/e-office-web/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF44D8F3),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    'gambar/japis-logo.jpg',
                    // height: 120.00,
                    // width: 180.00,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  right: 30,
                  left: 30,
                  top: MediaQuery.of(context).size.height / 4),
              child: Card(
                  child: Column(children: [
                Text(
                  'Welcome to',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Jayapura Aviation Polytechnic Integrated System \n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          InkWell(
                            onTap: _launchURL,
                            child: Container(
                              width: 80,
                              height: 80,
                              child:
                                  Image.asset('gambar/menu-eoffice-100px.png'),
                            ),
                          ),
                          Text("E-Office")
                        ]),
                        Column(children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Tracer study tapped.');
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child:
                                  Image.asset('gambar/menu-tracer-100px.png'),
                            ),
                          ),
                          Text('Tracer Study')
                        ]),
                        Column(children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              // print('Marketplace tapped.');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuMarketplace()));
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('gambar/menu-mp-100px.png'),
                            ),
                          ),
                          Text('Marketplace')
                        ]),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuVRT()));
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('gambar/menu-vrt-100px.png'),
                            ),
                          ),
                          Text("VRT")
                        ]),
                        Column(children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('AI tapped.');
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('gambar/menu-cc-100px.png'),
                            ),
                          ),
                          Text('COCC')
                        ]),
                        Column(children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('CC tapped.');
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('gambar/menu-ai-100px.png'),
                            ),
                          ),
                          Text('Cadet\'s Eye')
                        ]),
                      ],
                    )),
              ])),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Padding(padding: EdgeInsets.all(5))],
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.00),
            child: Text(
              'Our Partner:',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'gambar/partner-iata_100px.png',
              height: 65.00,
              width: 65.00,
            ),
            Image.asset(
              'gambar/partner-trainair-100px.png',
              height: 65.00,
              width: 65.00,
            ),
            Image.asset(
              'gambar/partner-blu-100px.png',
              height: 65.00,
              width: 65.00,
            ),
            Image.asset(
              'gambar/iso-cert_100px.png',
              height: 65.00,
              width: 65.00,
            )
          ],
        ),
      ],
    );
  }
}

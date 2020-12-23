import 'package:flutter/material.dart';
import 'package:japis_new/sub-halaman/Ecommerce/MP_Ecommerce.dart';
import 'package:japis_new/sub-halaman/Efacility/MP_Efacility.dart';
import 'package:japis_new/sub-halaman/Ehealthcare/MP_Ehealthcare.dart';
import 'package:japis_new/sub-halaman/Etraining/MP_Etraining.dart';

class MenuVRT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Marketplace')),
        body: Container(
            child: Stack(
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
              left: 30, right: 30, top: MediaQuery.of(context).size.height / 4),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Efacility()));
                              },
                              child: Image.asset('gambar/menu-vrt-100px.png')),
                          color: Color(0xFF44D8F3),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ECommerce()));
                              },
                              child: Image.asset('gambar/menu-vrt-100px.png')),
                          color: Color(0xFF44D8F3),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EHealthcare()));
                              },
                              child: Image.asset('gambar/menu-vrt-100px.png')),
                          color: Color(0xFF44D8F3),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Etraining()));
                              },
                              child: Image.asset('gambar/menu-vrt-100px.png')),
                          color: Color(0xFF44D8F3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )));
  }
}

// class MenuVRT extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('VRT')),
//         body: GridView.count(
//           primary: false,
//           padding: const EdgeInsets.all(20),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           crossAxisCount: 2,
//           children: <Widget>[
//             Card(
//               child: InkWell(
//                   onTap: () {},
//                   child: Image.asset('gambar/vrt-kampen_100px.png')),
//               color: Colors.teal[200],
//             ),
//             Card(
//               child: Image.asset('gambar/vrt-dbu_100px.png'),
//               color: Colors.teal[200],
//             ),
//             Card(
//               child: Image.asset('gambar/vrt-dnp_100px.png'),
//               color: Colors.teal[200],
//             ),
//             Card(
//               child: Image.asset('gambar/vrt-ditangud_100px.png'),
//               color: Colors.teal[200],
//             ),
//             Card(
//               child: Image.asset('gambar/vrt-dkppu_100px.png'),
//               color: Colors.teal[200],
//             ),
//           ],
//         ));
//   }
// }

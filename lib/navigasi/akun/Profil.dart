import 'package:flutter/material.dart';
import 'package:japis_new/DETAIL/detail/pembayaran/uploadfoto.dart';
import 'package:japis_new/main.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:japis_new/navigasi/akun/Login.dart';
import 'package:japis_new/navigasi/akun/editprofile.dart';
import 'package:japis_new/navigasi/akun/gantipassword.dart';
import 'package:japis_new/navigasi/akun/hubungikami.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanProfil extends StatelessWidget {
  @override
  hapus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("akun", null);
  }

  Widget build(BuildContext context) {
    logout(BuildContext context, String text) => showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Container(
                  height: 150,
                  width: 150,
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                      Text(
                        "Konfirmasi Logout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Apakah anda yakin?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Batal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Colors.orange,
                            thickness: 4,
                          ),
                          InkWell(
                            onTap: () {
                              hapus();

                              user = null;
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MyStatefulWidget()),
                                  (Route<dynamic> route) => false);
                              // Navigator.pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             MyStatefulWidget()),);
                            },
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                elevation: 3,
                // actionsPadding: EdgeInsets.only(right: 28),
                // actions: <Widget>[
                //   Row(
                //     children: <Widget>[
                //       // okButton,
                //       SizedBox(
                //         width: 22,
                //       ),
                //     ],
                //   )
                // ],
              ),
            ));

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Color(0xFF44D8F3),
              ),
              child: Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      user.image == null || user.image == ""
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UploadFoto()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  size: 65,
                                ),
                                radius: 50.0,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                user.image,
                              ),
                              radius: 50.0,
                            ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        user.nama,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfil()));
                    },
                    child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Profil Saya",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                          ),
                        ))),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ganti()));
                  },
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Ganti Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hubungi()));
                    },
                    child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Hubungi Kami",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                          ),
                        ))),
                Divider(
                  thickness: 3,
                )

                // SizedBox(
                //   height: 10.0,
                // ),
                // Text(
                //   'alicejames@gmail.com',
                //   style: TextStyle(
                //     fontSize: 15.0,
                //     fontStyle: FontStyle.italic,
                //     fontWeight: FontWeight.w300,
                //     color: Colors.black,
                //     letterSpacing: 2.0,
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Text(
                //   "No. WhatsApp:",
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontStyle: FontStyle.normal,
                //       fontSize: 20.0),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Text(
                //   '085634587612',
                //   style: TextStyle(
                //     fontSize: 15.0,
                //     fontStyle: FontStyle.italic,
                //     fontWeight: FontWeight.w300,
                //     color: Colors.black,
                //     letterSpacing: 2.0,
                //   ),
                // ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10.0,
          // ),
          InkWell(
            onTap: () {
              logout(context, "text");
              // user == null;
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => MyStatefulWidget()));
            },
            child: Container(
              height: 40,
              width: 70,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: Colors.red, style: BorderStyle.solid)),
                alignment: Alignment.center,
                child: Text(
                  "LOGOUT",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

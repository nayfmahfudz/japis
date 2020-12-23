import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Splash extends StatelessWidget {
  getPref(context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String value = preferences.getString("akun");
      await Future.delayed(const Duration(seconds: 3), () {
        // print(value);
      });
      if (value == null || value == "null") {
        // print("gagal");
        return "gagal";
      } else {
        print(user);
        Map data = json.decode(value);
        user = User.fromJson(data);
        print(user.id_member);
        return "sukses";
      }
    } catch (data) {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPref(context),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          print(snapshot.data);
          return Scaffold(
              backgroundColor: Color(0xFF44D8F3),
              body: Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 70),
                child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'gambar/japis-logo.jpg',
                        height: 120.00,
                        width: 160.00,
                      )),
                ),
              ));
        } else {
          //  (snapshot.data == "gagal" || snapshot.data == "sukses") {
          print(snapshot.data);
          return MyStatefulWidget();
          // } else {
          // return MyStatefulWidget();
        }
      },
    );
    // });
  }
}

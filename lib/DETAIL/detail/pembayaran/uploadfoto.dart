import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japis_new/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadFoto extends StatefulWidget {
  @override
  _UploadFotoState createState() => _UploadFotoState();
}

class _UploadFotoState extends State<UploadFoto> {
//   POST: http://japis.poltekbangjayapura.ac.id/api/avatar
// form-data:

// id_member (Text)
// userfile (File)

// example:
// POST http://japis.poltekbangjayapura.ac.id/api/avatar
// id_member: 2
// userfile: baju.jpg
// response:

// {
// "status": true,
// "message": "Avatar berhasil diupdate",
// "data": {
// "upload_data": {
// "file_name": "avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "file_type": "image/jpeg",
// "file_path": "/home/admin/web/japis.poltekbangjayapura.ac.id/public_html/assets/uploads/",
// "full_path": "/home/admin/web/japis.poltekbangjayapura.ac.id/public_html/assets/uploads/avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "raw_name": "avatar_2_KL7PfGrzaX6BwevU23jA",
// "orig_name": "avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "client_name": "baju.jpg",
// "file_ext": ".jpg",
// "file_size": 54.76,
// "is_image": true,
// "image_width": 640,
// "image_height": 426,
// "image_type": "jpeg",
// "image_size_str": "width=\"640\" height=\"426\""
// }
// }
// }
  Future post() async {
    Response response;
    Dio dio = new Dio();
    String fileName = ijazah.path.split('/').last;
    FormData formData = FormData.fromMap({
      "id_member": user.id_member,
      "userfile": await MultipartFile.fromFile(ijazah.path, filename: fileName),
    });
    response = await dio.post(
        "http://japis.poltekbangjayapura.ac.id/api/avatar",
        data: formData);
    print(response.data["data"]["upload_data"]["full_path"]);
    user.image = response.data["full_path"];
    print(response);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    if (response.data["status"] == true) {
      prefs.setString("akun", json.encode(user.toJson()));
    }
    ;
    return response.data;
  }
  // gg
  // Future post(id, total) async {
  //   final url = "http://japis.poltekbangjayapura.ac.id/api/avatar";
  //   final response = await http
  //       .post(url, body: {"id_member": user.id_member, "userfile": ijazah});

  //   final jsondata = jsonDecode(response.body);
  //   print(jsondata);

  //   return jsondata;
  // }

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
                    // "status": true,
// "message": "Avatar berhasil diupdate",
// "data": {
// "upload_data": {
// "file_name": "avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "file_type": "image/jpeg",
// "file_path": "/home/admin/web/japis.poltekbangjayapura.ac.id/public_html/assets/uploads/",
// "full_path": "/home/admin/web/japis.poltekbangjayapura.ac.id/public_html/assets/uploads/avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "raw_name": "avatar_2_KL7PfGrzaX6BwevU23jA",
// "orig_name": "avatar_2_KL7PfGrzaX6BwevU23jA.jpg",
// "client_name": "baju.jpg",
// "file_ext": ".jpg",
// "file_size": 54.76,
// "is_image": true,
// "image_width": 640,
// "image_height": 426,
// "image_type": "jpeg",
// "image_size_str": "width=\"640\" height=\"426\""
// }
// }
// }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Berkas(widget.judul)));
                    // // if (_formKey.currentState.validate()) {
                    post().then((value) {
                      // Map value;
                      // print(value["status"]);
                      if (value["status"] == true) {
                        Navigator.pop(context);
                        user.image = value["message"]["full_path"];
                        alarm(context, value["message"].toString());
                      } else {
                        alarm(context, value["message"].toString());
                      }
                    });
                  })),
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
                      // mainAxisAlignment: ,
                      children: [
                        Text(
                          "Upload Foto Profile",
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
                                            "Upload Foto",
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
                ],
              )),
            ),
          )),
    );
  }
}

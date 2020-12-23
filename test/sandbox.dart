// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(MyApp());

// class PostResult {
//   String id;
//   String name;
//   String job;
//   String created;

//   PostResult({this.id, this.name, this.job, this.created});

//   factory PostResult.createPostResult(Map<String, dynamic> object) {
//     return PostResult(
//         id: object['id'],
//         name: object['name'],
//         job: object['object'],
//         created: object['createdAt']);
//   }

//   static Future<PostResult> connectToApi(String name, String job) async {
//     String apiURL = 'https://reqres.in/api/users';

//     var apiResult = await http.post(apiURL, body: {"name": name, "job": job});
//     var jsonObject = json.decode(apiResult.body);

//     return PostResult.createPostResult(jsonObject);
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   PostResult postResult = null;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Text((postResult != null) ? postResult.id + " " : "Tidak ada data"),
//             RaisedButton(
//               onPressed: () {
//                 PostResult.connectToApi("Badu", "Dokter").then((value) {
//                   postResult = value;
//                   setState(() {});
//                 });
//               },
//               child: Text("POST"),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }

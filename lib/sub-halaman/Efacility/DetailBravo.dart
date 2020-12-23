import 'package:flutter/material.dart';

class DetailBravo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Image.asset('gambar/fasilitas/asrama-bravo.jpeg'),
      ),
    );
  }
}

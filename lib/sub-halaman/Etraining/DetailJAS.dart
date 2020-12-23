import 'package:flutter/material.dart';

class DetailJAS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Image.asset('gambar/training/junioravsec.jpeg'),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Nama Diklat: Junior Aviation Security ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Lama Diklat: 19 hari \n'),
              Text('Deskripsi Diklat: \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Pelatihan Penyelamatan Diri saat Evakuasi di Pesawat Udara diperuntukan bagi insan perhubungan dan/atau '
                  'masyarakat yang membutuhkan dalam rangka memberikan pengetahuan dan keterampilan tentang penyelamatan diri keadaan darurat di darat dan air. \n'),
              Text(
                'Persyaratan Peserta Diklat: \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '\n - Insan Perhubungan dan/atau masyarakat yang membutuhkan.'
                  '\n - Umur minimal 18 tahun. '
                  '\n - Sehat Jasmani dan rohani. '),
            ],
          ),
        ),
      ),
    );
  }
}

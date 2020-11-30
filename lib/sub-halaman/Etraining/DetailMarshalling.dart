import 'package:flutter/material.dart';

class DetailMarshalling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Image.asset('gambar/training/marshalling.jpeg'),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Nama Diklat: Marshalling ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Lama Diklat: 7 hari \n'),
              Text('Deskripsi Diklat: \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Memberikan pengetahuan tentang regulasi, General Aircraft Knowledge, '
                  'Aircraft Marshalling Service dan On The Job Training. \n'),
              Text(
                'Persyaratan Peserta Diklat: \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '\n - Pendidikan formal minimal lulusan SMA dan/atau sederajat.'
                  '\n - Berbadan sehat jasmani, rohani dan emosi stabil serta tidak buta warna yang dinyatakan '
                  'oleh Surat Keterangan dari Dokter Pemerintah.'
                  '\n - Rekomendasi surat dari pejabat yang berwenang atau intansi pengirim.'),
            ],
          ),
        ),
      ),
    );
  }
}

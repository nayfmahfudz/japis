import 'package:flutter/material.dart';

class DetailHFANP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Image.asset('gambar/training/lapangan.jpeg'),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Nama Diklat: Human Factor for Air Navigation Personnel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Lama Diklat: 5 hari \n'),
              Text('Deskripsi Diklat: \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Memberikan pengetahuan tentang Fundamental Human Factor, Human Factor in Air Navigation '
                  'dan Human Factor in Organization and Management. \n'),
              Text(
                'Persyaratan Peserta Diklat: \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '\n - Pendidikan formal minimal lulusan SMA dan/atau sederajat.'
                  '\n - Berbadan sehat jasmani, rohani dan emosi stabil serta tidak buta warna yang dinyatakan '
                  'oleh Surat Keterangan Dokter Pemerintah.'
                  '\n - Rekomendasi surat dari pejabat yang berwenang atau intansi pengirim.'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailBAS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Image.asset('gambar/training/security.jpeg'),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Nama Diklat: Basic Aviation Security ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Lama Diklat: 24 hari \n'),
              Text('Deskripsi Diklat: \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Pelatihan Pengamanan Penerbangan Tingkat Dasar (Basic Aviation Security) memberikan '
                  'pengetahuan tentang Peraturan-peraturan dasar keamanan penerbangan. \n'),
              Text(
                'Persyaratan Peserta Diklat: \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '\n - Pendidikan formal minimal lulusan SMA dan/atau sederajat.'
                  '\n - Berbadan sehat jasmani, rohani dan emosi stabil serta tidak buta warna '
                  'yang dinyatakan oleh Surat Keterangan Dokter.'
                  '\n - Berkelakuan baik yang dibuktikan dengan '
                  'Surat Keterangan Catatan Kepolisian (SKCK) dari kepolisian setempat.'),
            ],
          ),
        ),
      ),
    );
  }
}

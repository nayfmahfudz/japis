import 'package:flutter/material.dart';

class DetailSeMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Image.asset('gambar/training/simulasi.jpeg'),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Nama Diklat: Security Management System ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Lama Diklat: 5 hari \n'),
              Text('Deskripsi Diklat: \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Mempelajari dasar-dasar inisiatif SeMS dan bagaimana hal itu dapat membuat organisasi anda '
                  'mematuhi ketentuan dan peraturan terkait keamanan penerbangan nasional. \n'),
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

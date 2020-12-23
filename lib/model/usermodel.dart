User user;

class User {
  User({
    this.token,
    this.id_member,
    this.nama,
    this.password,
    this.email,
    this.image,
    this.telpon,
    this.alamat,
    this.aktif,
    this.kode_verif_email,
    this.verif_email_date,
    this.verif_berkas_date,
    this.reg_date,
    this.update_date,
    this.username,
    this.kebangsaan,
    this.negara,
    this.tanggal_lahir,
    this.kelamin,
    this.pasport_ktp,
    this.darah,
    this.nama_darurat,
    this.telepon_darurat,
    this.ukuran_baju,
    this.berat_badan,
  });

  String kebangsaan,
      token,
      negara,
      tanggal_lahir,
      kelamin,
      pasport_ktp,
      darah,
      nama_darurat,
      telepon_darurat,
      ukuran_baju,
      berat_badan,
      kode_verif_email,
      verif_email_date,
      verif_berkas_date,
      reg_date,
      update_date;

  String id_member;
  String nama;
  String password;
  String email;
  String image;
  String username;
  String id_kabupaten;
  String id_kecamatan;
  String aktif;
  String alamat;
  String telpon;

  // List<User> columns = [];

  // String toString() {
  //   return 'User{nama: $nama, id: $id,password: $password ,email: $email , image:$image, alamat: $alamat ,telpon: $telpon }';
  // }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        kode_verif_email: json["kode_verif_email"],
        verif_email_date: json["verif_email_date"],
        verif_berkas_date: json["verif_berkas_date"],
        reg_date: json["reg_date"],
        update_date: json["update_date"],
        id_member: json["id_member"],
        token: json["token"],
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        alamat: json["alamat"],
        telpon: json["no_wa"],
        image: json["image"],
        aktif: json["aktif"].toString(),
        // kode_verif_email: json["kode_verif_email"].toString(),
        kebangsaan: json["kebangsaan"],
        tanggal_lahir: json["tgl_lahir"],
        kelamin: json["kelamin"],
        pasport_ktp: json["no_ktp"],
        darah: json["darah"],
        negara: json["negara"],
        nama_darurat: json["nama_darurat"],
        telepon_darurat: json["telepon_darurat"],
        ukuran_baju: json["ukuran_baju"],
        berat_badan: json["berat_badan"].toString());
  }
  Map<String, dynamic> toJson() => {
        "kode_verif_email": kode_verif_email,
        "verif_email_date": verif_email_date,
        "verif_berkas_date": verif_berkas_date,
        "reg_date": reg_date,
        "update_date": update_date,
        "id_member": id_member,
        "token": token,
        "nama": nama,
        "username": username,
        "password": password,
        "email": email,
        "alamat": alamat,
        "no_wa": telpon,
        "image": image,
        "aktif": aktif,
        "kode_verif_email": kode_verif_email,
        "id_kabupaten": id_kabupaten,
        "id_kecamatan": id_kecamatan,
        "kebangsaan": kebangsaan,
        "tgl_lahir": tanggal_lahir,
        "kelamin": kelamin,
        "no_ktp": pasport_ktp,
        "darah": darah,
        "negara": negara,
        "nama_darurat": nama_darurat,
        "telepon_darurat": telepon_darurat,
        "ukuran_baju": ukuran_baju,
        "berat_badan": berat_badan,
      };
}

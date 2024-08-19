import 'dart:convert';
// import 'dart:developer';

import 'package:http/http.dart' as http;
// import 'package:loginn/bayar_selesai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final String baseUrl = 'https://hukumonline.saumatateknosainsglobal.com';

// untuk registrasi user
  Future<Map<String, dynamic>> postData(
      String nama, String hp, String email, String password) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/register/user"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      var params = {
        'nama': nama, // Menambahkan kode ke params
        'hp': hp,
        'email': email,
        'password': password // Menambahkan nama ke params
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {'status': true, 'msg': responseBody['msg']};
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

// Untuk login akun
  Future<Map<String, dynamic>> postDataLogin(
      String email, String password) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/login"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      var params = {
        'email': email,
        'password': password // Menambahkan nama ke params
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool('is_logged_in', true);
          pref.setString("sys_branches_id", responseBody['cabang_id']);
          pref.setString("nama", responseBody['user_nama']);
          pref.setString("email", responseBody['user_email']);
          pref.setString("noHp", responseBody['user_hp']);
          pref.setString("id_user", responseBody['user_id']);
          pref.setString("id_kontak", responseBody['kontak_id']);
          pref.setString("namaRole", responseBody['role_nama']);
          pref.setString("id_role", responseBody['role_id']);
          pref.setString("aliasRole", responseBody['role_alias']);
          pref.setString("tipeKontakAlias", responseBody['user_tipe']);
          return {'status': true, 'msg': responseBody['msg']};
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

//untuk daftar mitra pada form mitra
  Future<Map<String, dynamic>> postDataMitra(
      String company, String type) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/register/mitra"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var idKontak = pref.getString('id_kontak');
      var params = {'kontak': idKontak, 'company': company, 'tipe': type};

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("sys_branches_id", responseBody['data']['cabang_id']);
          pref.setString("namaRole", responseBody['data']['role_nama']);
          pref.setString("id_role", responseBody['data']['role_id']);
          pref.setString("aliasRole", responseBody['data']['role_alias']);
          pref.setString("tipeKontakAlias",
              responseBody['data']['kontak_detail']['tipe_kontak_alias']);
          return {'status': true, 'msg': responseBody['msg']};
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

//untuk menampilkan semua data dari api
  Future<Map<String, dynamic>> editDataPribadiMitra() async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/profile"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");
      var kontakId = pref.getString("id_kontak");

      var params = {'kontak': kontakId, 'cabang': sysBranchesId};

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      List listKlasifikasi = responseBody['data']['refklasifikasi'];

      List listKontakKeahlian = responseBody['data']['keahlian'];

      for (var i = 0; i < listKlasifikasi.length; i++) {
        bool checked = listKontakKeahlian
            .where(
                (element) => element['id_keahlian'] == listKlasifikasi[i]['id'])
            .toList()
            .isNotEmpty;
        listKlasifikasi[i]['status'] = checked;
      }

      List listPengalaman = [];

      for (var i = 0; i < responseBody['data']['pengalaman'].length; i++) {
        int checked = listKlasifikasi.indexWhere((element) =>
            element['id'] ==
            responseBody['data']['pengalaman'][i]['id_klasifikasi']);
        if (checked != -1) {
          listPengalaman.add(<String, dynamic>{
            ...responseBody['data']['pengalaman'][i],
            'nama_klasifikasi': listKlasifikasi[checked]["nama"]
          });
        }
      }

      // berhasil semua
      return {
        'status': true,
        'data': responseBody['data']['kontak'], //kontak
        'pendidikan': responseBody['data']['pendidikan'], //daftar pendidikan
        'keahlian': listKontakKeahlian, //daftar keahlian
        'pengalaman': listPengalaman, //daftar pengalaman
        'refklasifikasi': listKlasifikasi //daftar refklasifikasi
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

// untuk menyimpan data yang di update ke dalam database
  Future<Map<String, dynamic>> putTombolSimpanData({
    required String nama,
    required String email,
    required String nik,
    required String nia,
    required String nohp,
    required String tempatLahir,
    required String tglLahir,
    required String alamat,
    required String profile,
    required String kabKota,
  }) async {
    try {
      var request = http.Request(
        'PUT', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'table': 'master_kontak',
        'id': kontakId,
        'nama': nama,
        'email': email,
        'hp': nohp,
        'ktp': nik,
        'alamat': alamat,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tglLahir,
        'profil': profile,
        'kabkota': kabKota
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
            // 'data': responseBody['data'][0]
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  // untuk menyimpan data yang di update ke dalam database
  Future<Map<String, dynamic>> putTombolSimpanDataUser({
    required String nama,
    required String email,
    required String nohp,
    required String alamat,
  }) async {
    try {
      var request = http.Request(
        'PUT', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'table': 'master_kontak',
        'id': kontakId,
        'nama': nama,
        'email': email,
        'hp': nohp,
        'alamat': alamat,
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
            // 'data': responseBody['data'][0]
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

// untuk menambah data ke dalam kolom
  Future<Map<String, dynamic>> postPendidikanMitra({
    required String jenjang,
    required String prodi,
    required String jurusan,
    required String perguruanTinggi,
    required String thnLulus,
  }) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'id_kontak': kontakId,
        'table': 'master_kontak_pendidikan',
        "jenjang": jenjang,
        "tahun_selesai": thnLulus,
        "jurusan": jurusan,
        "prodi": prodi,
        "pt": perguruanTinggi,
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

// Menghapus Pendidikan
  Future<Map<String, dynamic>> deletePendidikanMitra({
    required String id,
  }) async {
    try {
      var request = http.Request(
        'DELETE', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'id_master_kontak': kontakId,
        'table': 'master_kontak_pendidikan',
        'where': {
          'id': id,
        }
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

//Menambah Data Keahlian
  // Future<Map<String, dynamic>> postKeahlianMitra() async {
  //   try {
  //     var request = http.Request(
  //       'POST', // Mengubah metode permintaan menjadi POST
  //       Uri.parse("$baseUrl/api/ws"),
  //     )..headers.addAll({
  //         'Content-Type': 'application/json',
  //         'HUKUMONLINE-API-KEY': 'r2398hr2h9',
  //         'Authorization':
  //             'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
  //       });

  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     var kontakId = pref.getString("id_kontak");

  //     var params = {
  //       'table': 'master_kontak_keahlian',
  //       'where': {'master_kontak_keahlian.id_master_kontak': kontakId},
  //       'join': {
  //         'ref_klasifikasi_pidana":"ref_klasifikasi_pidana.id=master_kontak_keahlian.id_keahlian'
  //       }
  //     };

  //     request.body = jsonEncode(params);
  //     var response = await http.Response.fromStream(await request.send());
  //     var responseBody = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (responseBody['status'] == true) {
  //         return {
  //           'status': true,
  //           'msg': responseBody['msg'],
  //         };
  //       } else {
  //         return {
  //           'status': false,
  //           'msg': responseBody['error'] ?? responseBody['msg']
  //         };
  //       }
  //     } else {
  //       return {
  //         'status': false,
  //         'msg': responseBody['error'] ??
  //             responseBody['msg'] ??
  //             'Terjadi kesalahan di server'
  //       };
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     return {'status': false, 'msg': 'Terjadi kesalahan di server'};
  //   }
  // }

  //tambah data keahlian
  // Future<Map<String, dynamic>> simpanKeahlianMitra(
  //     String company, String type) async {
  //   try {
  //     var request = http.Request(
  //       'POST', // Mengubah metode permintaan menjadi POST
  //       Uri.parse("$baseUrl/api/ws"),
  //     )..headers.addAll({
  //         'Content-Type': 'application/json',
  //         'HUKUMONLINE-API-KEY': 'r2398hr2h9',
  //         'Authorization':
  //             'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
  //       });

  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     var idKontak = pref.getString('id_kontak');
  //     var params = {
  //       'table': 'master_kontak_keahlian',
  //       'kontak': idKontak,
  //     };

  //     request.body = jsonEncode(params);
  //     var response = await http.Response.fromStream(await request.send());
  //     var responseBody = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (responseBody['status'] == true) {
  //         SharedPreferences pref = await SharedPreferences.getInstance();
  //         pref.setString("sys_branches_id", responseBody['data']['cabang_id']);
  //         pref.setString("namaRole", responseBody['data']['role_nama']);
  //         pref.setString("id_role", responseBody['data']['role_id']);
  //         pref.setString("aliasRole", responseBody['data']['role_alias']);
  //         pref.setString("tipeKontakAlias",
  //             responseBody['data']['kontak_detail']['tipe_kontak_alias']);
  //         return {'status': true, 'msg': responseBody['msg']};
  //       } else {
  //         return {
  //           'status': false,
  //           'msg': responseBody['error'] ?? responseBody['msg']
  //         };
  //       }
  //     } else {
  //       return {
  //         'status': false,
  //         'msg': responseBody['error'] ??
  //             responseBody['msg'] ??
  //             'Terjadi kesalahan di server'
  //       };
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     return {'status': false, 'msg': 'Terjadi kesalahan di server'};
  //   }
  // }

  //Tambah Bidang keahlian pada checbox
  Future<Map<String, dynamic>> tambahKeahlianMitra({
    required String idKeahlian,
  }) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'id_kontak': kontakId,
        'table': 'master_kontak_keahlian',
        'id_keahlian': idKeahlian
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Cancel Bidang keahlian(checkbox)
  Future<Map<String, dynamic>> cancleKeahlianMitra({
    required String idKeahlian,
  }) async {
    try {
      var request = http.Request(
        'DELETE', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");

      var params = {
        'table': 'master_kontak_keahlian',
        'where': {'id_kontak': kontakId, 'id_keahlian': idKeahlian}
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Get Pilih bidang keahlian pada dropdown
  Future<Map<String, dynamic>> getPengalamanMitra() async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      var params = {'table': 'ref_klasifikasi_pidana'};

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      // berhasil semua
      return {
        'status': true,
        'klasifikasi': responseBody['data'], //daftar pendidikan
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Tambah Data Pengalaman di kolom
  Future<Map<String, dynamic>> postPengalamanMitra({
    required String noKasus,
    required String pengadilan,
    required String tahun,
    required String catatan,
    required String klasifikasi,
  }) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");
      var kontakId = pref.getString("id_kontak");

      var params = {
        'id_klasifikasi': klasifikasi,
        'id_kontak': kontakId,
        'sys_branches_id': sysBranchesId,
        'table': 'master_kontak_pengalaman',
        'nokasus': noKasus,
        'pengadilan': pengadilan,
        'tahun': tahun,
        'catatan': catatan
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  // Menghapus Pengalaman
  Future<Map<String, dynamic>> deletePengalamanMitra({
    required String id,
  }) async {
    try {
      var request = http.Request(
        'DELETE', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var kontakId = pref.getString("id_kontak");
      var sysBranchesId = pref.getString("sys_branches_id");

      var params = {
        'id_kontak': kontakId,
        'table': 'master_kontak_pengalaman',
        'where': {
          'sys_branches_id': sysBranchesId,
          'id': id,
        }
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

//untuk menampilkan nama, kota, dan profile pada halaman cari mitra
  Future<Map<String, dynamic>> cariAdvokat(
      {String? nama, String tipe = 'advokat', List kabKota = const []}) async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");

      var params = {
        'table': 'master_kontak',
        'like': {'nama': nama},
        if (kabKota.isNotEmpty) 'wherein': {'kabkota': kabKota},
        'where': {'sys_branches_id': sysBranchesId, "tipe_kontak_alias": tipe}
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      // berhasil semua
      return {
        'status': true,
        'data': responseBody['data'], //daftar pendidikan
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

//untuk profile mitra
  Future<Map<String, dynamic>> getProfileAdvokat() async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/profile"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");
      var kontakId = pref.getString("id_kontak");

      var params = {'kontak': kontakId, 'cabang': sysBranchesId};

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      List listKlasifikasi = responseBody['data']['refklasifikasi'];

      List listKontakKeahlian = [];

      for (var i = 0; i < responseBody['data']['keahlian'].length; i++) {
        int checked = listKlasifikasi.indexWhere((element) =>
            element['id'] ==
            responseBody['data']['keahlian'][i]['id_keahlian']);
        if (checked != -1) {
          listKontakKeahlian.add(<String, dynamic>{
            ...responseBody['data']['keahlian'][i],
            'nama_keahlian': listKlasifikasi[checked]["nama"]
          });
        }
      }

      List listPengalaman = [];

      for (var i = 0; i < responseBody['data']['pengalaman'].length; i++) {
        int checked = listKlasifikasi.indexWhere((element) =>
            element['id'] ==
            responseBody['data']['pengalaman'][i]['id_klasifikasi']);
        if (checked != -1) {
          listPengalaman.add(<String, dynamic>{
            ...responseBody['data']['pengalaman'][i],
            'nama_klasifikasi': listKlasifikasi[checked]["nama"]
          });
        }
      }

      // berhasil semua
      return {
        'status': true,
        'dataPribadi': responseBody['data']['kontak'], //kontak
        'pendidikan': responseBody['data']['pendidikan'], //daftar pendidikan
        'keahlian': listKontakKeahlian, //daftar keahlian
        'pengalaman': listPengalaman, //daftar pengalaman
        // 'refklasifikasi': listKlasifikasi //daftar refklasifikasi
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Get Pilih Kategori Layanan
  Future<Map<String, dynamic>> getKategoriProduk() async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      var params = {'table': 'produk_kategori'};

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      // berhasil semua
      return {
        'status': true,
        'kategori': responseBody['data'], //daftar pendidikan
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Tambah Data Layanan yang disediakan mitra
  Future<Map<String, dynamic>> postLayananMitra({
    required String nama,
    required String durasi,
    required String hargaJual,
    // required String deskripsi,
    required String kategori,
  }) async {
    try {
      var request = http.Request(
        'POST', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");
      var kontakId = pref.getString("id_kontak");

      var params = {
        'id_kategori': kategori,
        'id_kontak': kontakId,
        'sys_branches_id': sysBranchesId,
        'table': 'produk',
        'nama': nama,
        'durasi': durasi,
        'harga_jual': hargaJual,
        // 'deskripsi': deskripsi
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  //Get Layanan yang telah dibuat ole mitra
  Future<Map<String, dynamic>> getLayananMitra() async {
    try {
      var request = http.Request(
        'GET', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");

      var params = {
        'table': 'produk',
        'where': {
          'sys_branches_id': sysBranchesId,
        }
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      //request ke 1 gagal
      if (response.statusCode != 200) {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }

      if (responseBody['status'] != true) {
        return {
          'status': false,
          'msg': responseBody['error'] ?? responseBody['msg']
        };
      }

      // berhasil semua
      return {
        'status': true,
        'kategori': responseBody['data'], //daftar pendidikan
      };
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }

  // Menghapus Layanan Mitra
  Future<Map<String, dynamic>> deleteLayananMitra({
    required String id,
  }) async {
    try {
      var request = http.Request(
        'DELETE', // Mengubah metode permintaan menjadi POST
        Uri.parse("$baseUrl/api/ws"),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'HUKUMONLINE-API-KEY': 'r2398hr2h9',
          'Authorization':
              'Bearer YlJkZm45T2psWUNVSExIQU9KUTVNckVJbjYrR3RPT2ZvL2RUYjFFQ01sVjFibFc1NTB4M0VRc1Z1SWNqWjBCNzV3a2tCUndmR2p0Z0pKVEJLUHg2VHc9PQ==',
        });

      SharedPreferences pref = await SharedPreferences.getInstance();
      var sysBranchesId = pref.getString("sys_branches_id");

      var params = {
        'table': 'produk',
        'where': {
          'sys_branches_id': sysBranchesId,
          'id': id,
        }
      };

      request.body = jsonEncode(params);
      var response = await http.Response.fromStream(await request.send());
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseBody['status'] == true) {
          return {
            'status': true,
            'msg': responseBody['msg'],
          };
        } else {
          return {
            'status': false,
            'msg': responseBody['error'] ?? responseBody['msg']
          };
        }
      } else {
        return {
          'status': false,
          'msg': responseBody['error'] ??
              responseBody['msg'] ??
              'Terjadi kesalahan di server'
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {'status': false, 'msg': 'Terjadi kesalahan di server'};
    }
  }
}

// informasi user
// _emailindormasi noKasus
// informasi advokat
// rincian pesanan
// meetode pembayaran
// hapus rincian Pembayaran{nama produk x 1 sebelahnya harganya}
// suntotal
// biaya admin
// total
//  bagian metode pembayaran bagian bawah tambah belum memilih
// tanda panah ganti jd teks pilih

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/api/apis.dart';
import 'package:loginn/bottomnav.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';
// import 'package:loginn/tambah_keahlian.dart';
import 'package:loginn/tambah_pendidikan.dart';

class UbahDataMitraNotarisView extends StatefulWidget {
  const UbahDataMitraNotarisView({super.key});

  @override
  State<UbahDataMitraNotarisView> createState() =>
      _UbahDataMitraNotarisViewState();
}

class _UbahDataMitraNotarisViewState extends State<UbahDataMitraNotarisView> {
  bool isLoading = false;
  Repository repository = Repository();
  final namaController = TextEditingController();
  final nikController = TextEditingController();
  final niaController = TextEditingController();
  final noNotarisController = TextEditingController();
  final noPpatController = TextEditingController();
  final emailController = TextEditingController();
  final nohpController = TextEditingController();
  final alamatController = TextEditingController();
  final tempatlahirController = TextEditingController();
  final tglahirController = TextEditingController();
  final kabKotaController = TextEditingController();
  final profileController = TextEditingController();

  List<Map<String, dynamic>> listData = [];

  List<Map<String, dynamic>> listDataPengalaman = [];

  List<Map<String, dynamic>> dataKlasifikasi = [];

  List<Map<String, dynamic>> dataPengalaman = [];

  List<Map<String, dynamic>> dataKeahlian = [];

  //Data Pribadi
  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.editDataPribadiMitra();

    isLoading = false;

    if (response['status'] == true) {
      namaController.text = response['data']['nama'] ?? '';
      nikController.text = response['data']['ktp'] ?? '';
      niaController.text = response['data']['nia'] ?? '';
      noNotarisController.text = response['data']['no_notaris'] ?? '';
      noPpatController.text = response['data']['no_ppat'] ?? '';
      emailController.text = response['data']['email'] ?? '';
      nohpController.text = response['data']['hp'] ?? '';
      alamatController.text = response['data']['alamat'] ?? '';
      tempatlahirController.text = response['data']['tempat_lahir'] ?? '';
      tglahirController.text = response['data']['tanggal_lahir'] ?? '';
      kabKotaController.text = response['data']['kabkota'] ?? '';
      profileController.text = response['data']['profil'] ?? '';

      listData = List<Map<String, dynamic>>.from(response['pendidikan']);
      listDataPengalaman =
          List<Map<String, dynamic>>.from(response['pengalaman']);
      dataKeahlian = List<Map<String, dynamic>>.from(response['keahlian']);
      dataPengalaman = List<Map<String, dynamic>>.from(response['pengalaman']);
      dataKlasifikasi =
          List<Map<String, dynamic>>.from(response['refklasifikasi']);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    setState(() {});
  }

//menyimpan Data Pribadi yang sudah diupdate
  postData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.putTombolSimpanData(
        email: emailController.text,
        nohp: nohpController.text,
        nama: namaController.text,
        nik: nikController.text,
        nia: niaController.text,
        noNotaris: noNotarisController.text,
        noPpat: noPpatController.text,
        tempatLahir: tempatlahirController.text,
        tglLahir: tglahirController.text,
        alamat: alamatController.text,
        kabKota: kabKotaController.text,
        profile: profileController.text);
    await APIs.updateUserInfo(namaController.text).then(
      (value) {
        APIs.getSelfInfo();
      },
    );

    isLoading = false;

    if (response['status'] == true) {
      getData();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    setState(() {});
  }

//Menghapus index pendidikan
  deleteData(int index) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.deletePendidikanMitra(id: listData[index]['id']);
    isLoading = false;
    if (response['status'] == true) {
      getData();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    setState(() {});
  }

// Menambah Keahlian pada checkbox
  Future<bool> postKeahlian(String id) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.tambahKeahlianMitra(idKeahlian: id);

    isLoading = false;
    setState(() {});
    if (response['status'] == true) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
      return false;
    }
  }

// Menghapus Keahlian dengan cara checkbox
  Future<bool> deleteKeahlian(String id) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.cancleKeahlianMitra(idKeahlian: id);

    isLoading = false;
    setState(() {});
    if (response['status'] == true) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
      return false;
    }
  }

//Menghapus index pengalaman
  deleteDataPengalaman(int index) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.deletePengalamanMitra(
        id: listDataPengalaman[index]['id']);
    isLoading = false;
    if (response['status'] == true) {
      getData();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => Future.delayed(
        const Duration(milliseconds: 500),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomNavView(),
            ),
            (route) => false),
        // data[i]['nama']
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Edit Profile',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/profile 1.png',
                          width: 150,
                          height: 150,
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: Text(
                        //     'Ganti Foto profil',
                        //     style: GoogleFonts.ubuntu(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //       color: GlobalColors.mainColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            color: GlobalColors.mainColor,
                            child: TabBar(
                              unselectedLabelColor: Colors.black,
                              indicatorColor: Colors.white,
                              labelColor: Colors.white,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Data Pribadi',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Pendidikan',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      // color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Tab(
                                //   child: Text(
                                //     'Bidang Keahlian',
                                //     style: GoogleFonts.ubuntu(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w500,
                                //       // color: Colors.black,
                                //     ),
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                                // Tab(
                                //   child: Text(
                                //     'Pengalaman',
                                //     style: GoogleFonts.ubuntu(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w500,
                                //       // color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                //Tab 1
                                Column(
                                  children: [
                                    Expanded(
                                      child: ListView(children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextFormField(
                                                onSaved: (val) =>
                                                    APIs.me.name = val ?? '',
                                                controller: namaController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                  labelText: 'Nama Lengkap',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Masukkan Nama Lengkap',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: nikController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'NIK',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText: 'Masukkan NIK',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: noNotarisController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Nomor SK Notaris',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Contoh: AHU-0039.AH.02.01-Tahun 2014',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: noPpatController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Nomor SK PPAT',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Contoh: 2/KEP-17.3/I/2015',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: emailController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: 'Email',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText: 'Masukkan Email',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: nohpController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                  labelText: 'No HP',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText: 'Masukkan No HP',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller:
                                                    tempatlahirController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Tempat Lahir',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Masukkan Tempat Lahir',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: tglahirController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Tanggal Lahir',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Masukkan Tanggal Lahir',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: alamatController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Alamat',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText: 'Masukkan Alamat',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: kabKotaController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Kab/Kota',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Masukkan Kab/Kota Anda',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: profileController,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Profile Singkat',
                                                  labelStyle:
                                                      GoogleFonts.ubuntu(),
                                                  hintText:
                                                      'Contoh: Saya Seorang Advokat Profesional',
                                                  hintStyle: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border:
                                                      const UnderlineInputBorder(),
                                                ),
                                              ),
                                              // Container(
                                              //   width: double.infinity,
                                              //   height: 52,
                                              //   margin: const EdgeInsets.only(
                                              //       left: 26,
                                              //       right: 26,
                                              //       top: 10,
                                              //       bottom: 20),
                                              //   child: ElevatedButton(
                                              //       style: ElevatedButton.styleFrom(
                                              //         backgroundColor:
                                              //             GlobalColors.mainColor,
                                              //       ),
                                              //       onPressed: postData,
                                              //       child: Text('Simpan',
                                              //           style: GoogleFonts.ubuntu(
                                              //             fontSize: 16,
                                              //             fontWeight: FontWeight.w500,
                                              //             color:
                                              //                 GlobalColors.btnColor,
                                              //           ))),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 52,
                                      margin: const EdgeInsets.only(
                                          left: 26,
                                          right: 26,
                                          top: 10,
                                          bottom: 20),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                GlobalColors.mainColor,
                                          ),
                                          onPressed: postData,
                                          child: Text('Simpan',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: GlobalColors.btnColor,
                                              ))),
                                    )
                                  ],
                                ),

                                //Tab2
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              var result = await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AddPendidikan()));
                                              if (result != null) getData();
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: GlobalColors.mainColor,
                                            ))
                                      ],
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            listData[i]
                                                                ['jenjang'],
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            listData[i]
                                                                ['prodi'],
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    ),
                                                    Text(listData[i]['jurusan'],
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        )),
                                                    Text(listData[i]['pt'],
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        )),
                                                    Text(
                                                        listData[i]
                                                            ['tahun_selesai'],
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              IconButton(
                                                  onPressed: () async {
                                                    if (i != null &&
                                                        i >= 0 &&
                                                        i < listData.length) {
                                                      await deleteData(i);
                                                    }
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete))
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: ((context, index) {
                                        return const Divider();
                                      }),
                                      itemCount: listData.length,
                                    ),
                                  ],
                                ),

                                //Tab3
                                // Column(
                                //   children: [
                                //     Expanded(
                                //       child: ListView.builder(
                                //           shrinkWrap: true,
                                //           itemCount: dataKlasifikasi.length,
                                //           itemBuilder: (context, index) {
                                //             return CheckboxListTile(
                                //                 dense: true,
                                //                 contentPadding:
                                //                     const EdgeInsets.only(
                                //                         top: 1,
                                //                         left: 10,
                                //                         right: 10),
                                //                 title: Text(
                                //                     dataKlasifikasi[index]
                                //                         ['nama']),
                                //                 value: dataKlasifikasi[index]
                                //                     ['status'],
                                //                 onChanged: (value) async {
                                //                   bool result = false;
                                //                   if (value == true) {
                                //                     result = await postKeahlian(
                                //                         dataKlasifikasi[index]
                                //                             ['id']);
                                //                   } else {
                                //                     result =
                                //                         await deleteKeahlian(
                                //                             dataKlasifikasi[
                                //                                 index]['id']);
                                //                   }
                                //                   if (result == true) {
                                //                     setState(() {
                                //                       dataKlasifikasi[index]
                                //                           ['status'] = value!;
                                //                     });
                                //                   }
                                //                 });
                                //           }),
                                //     ),
                                //   ],
                                // ),

                                //Tab4
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.end,
                                //       children: [
                                //         IconButton(
                                //             onPressed: () async {
                                //               var result = await Navigator.push(
                                //                   context,
                                //                   MaterialPageRoute(
                                //                       builder: (context) =>
                                //                           const AddKeahlian()));
                                //               if (result != null) getData();
                                //             },
                                //             icon: Icon(
                                //               Icons.add,
                                //               color: GlobalColors.mainColor,
                                //             ))
                                //       ],
                                //     ),
                                //     Expanded(
                                //       child: ListView.separated(
                                //         shrinkWrap: true,
                                //         itemBuilder: (context, i) {
                                //           return Padding(
                                //             padding:
                                //                 const EdgeInsets.only(left: 10),
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment
                                //                       .spaceBetween,
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Expanded(
                                //                   child: Column(
                                //                     crossAxisAlignment:
                                //                         CrossAxisAlignment.start,
                                //                     mainAxisAlignment:
                                //                         MainAxisAlignment.start,
                                //                     children: [
                                //                       Row(
                                //                         children: [
                                //                           Text(
                                //                               listDataPengalaman[
                                //                                       i][
                                //                                   'nama_klasifikasi'],
                                //                               style: GoogleFonts
                                //                                   .ubuntu(
                                //                                 fontSize: 14,
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w500,
                                //                               )),
                                //                           const SizedBox(
                                //                             width: 5,
                                //                           ),
                                //                           Text('-',
                                //                               style: GoogleFonts
                                //                                   .ubuntu(
                                //                                 fontSize: 14,
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w500,
                                //                               )),
                                //                           const SizedBox(
                                //                             width: 5,
                                //                           ),
                                //                           Text(
                                //                               listDataPengalaman[
                                //                                   i]['catatan'],
                                //                               style: GoogleFonts
                                //                                   .ubuntu(
                                //                                 fontSize: 14,
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w500,
                                //                               )),
                                //                         ],
                                //                       ),
                                //                       Text(
                                //                           listDataPengalaman[i]
                                //                               ['nokasus'],
                                //                           style:
                                //                               GoogleFonts.ubuntu(
                                //                             fontSize: 14,
                                //                             fontWeight:
                                //                                 FontWeight.w300,
                                //                           )),
                                //                       Text(
                                //                           listDataPengalaman[i]
                                //                               ['pengadilan'],
                                //                           style:
                                //                               GoogleFonts.ubuntu(
                                //                             fontSize: 14,
                                //                             fontWeight:
                                //                                 FontWeight.w300,
                                //                           )),
                                //                       Text(
                                //                           listDataPengalaman[i]
                                //                               ['tahun'],
                                //                           style:
                                //                               GoogleFonts.ubuntu(
                                //                             fontSize: 14,
                                //                             fontWeight:
                                //                                 FontWeight.w300,
                                //                           )),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 const SizedBox(width: 10),
                                //                 IconButton(
                                //                     onPressed: () async {
                                //                       if (i != null &&
                                //                           i >= 0 &&
                                //                           i <
                                //                               listDataPengalaman
                                //                                   .length) {
                                //                         await deleteDataPengalaman(
                                //                             i);
                                //                       }
                                //                     },
                                //                     icon: const Icon(
                                //                         Icons.delete))
                                //               ],
                                //             ),
                                //           );
                                //         },
                                //         separatorBuilder: ((context, index) {
                                //           return const Divider();
                                //         }
                                //         ),
                                //         itemCount: listDataPengalaman.length,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isLoading,
                child: const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
